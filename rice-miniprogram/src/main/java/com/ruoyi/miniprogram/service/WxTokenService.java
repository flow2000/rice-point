package com.ruoyi.miniprogram.service;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ip.AddressUtils;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.miniprogram.domain.WxUser;
import eu.bitwalker.useragentutils.UserAgent;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @Author: panghai
 * @Date: 2023/02/08
 * @Description: 微信端token验证处理
 */
@Component
public class WxTokenService {

    // 令牌自定义标识
    @Value("${token.header}")
    private String header;

    // 令牌秘钥
    @Value("${token.secret}")
    private String secret;

    // 令牌有效期（默认30分钟）
    @Value("${token.expireTime}")
    private int expireTime;

    /**
     * 微信令牌有效期（默认3天）
     */
    @Value("${token.wxExpireTime}")
    protected int wxExpireTime;

    protected static final long MILLIS_SECOND = 1000;

    protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;

    protected static final long MILLIS_HOUR = 60 * MILLIS_MINUTE;

    protected static final long MILLIS_DAY = 24 * MILLIS_MINUTE;

    @Autowired
    private RedisCache redisCache;

    /**
     * 创建令牌
     *
     * @param wxUser 微信用户信息
     * @return 令牌
     */
    public String createToken(WxUser wxUser) {

        String token = wxUser.getOpenId();
        wxUser.setToken(token);
        setUserAgent(wxUser);
        refreshToken(wxUser);

        Map<String, Object> claims = new HashMap<>();
        claims.put(Constants.LOGIN_USER_KEY, token);
        return createToken(claims);
    }

    /**
     * 刷新令牌有效期
     *
     * @param wxUser 登录信息
     */
    public void refreshToken(WxUser wxUser) {
        wxUser.setLoginTime(System.currentTimeMillis());
        wxUser.setExpireTime(wxUser.getLoginTime() + expireTime * MILLIS_DAY);
        // 根据uuid将loginUser缓存
        String userKey = getTokenKey(wxUser.getToken());
        redisCache.setCacheObject(userKey, wxUser, expireTime, TimeUnit.DAYS);
    }

    /**
     * 从数据声明生成令牌
     *
     * @param claims 数据声明
     * @return 令牌
     */
    private String createToken(Map<String, Object> claims) {
        String token = Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS512, secret).compact();
        return token;
    }

    /**
     * 从令牌中获取数据声明
     *
     * @param token 令牌
     * @return 数据声明
     */
    private Claims parseToken(String token) {
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 设置用户代理信息
     *
     * @param wxUser 登录信息
     */

    public void setUserAgent(WxUser wxUser) {
        UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        String ip = IpUtils.getIpAddr(ServletUtils.getRequest());
        wxUser.setIpaddr(ip);
        wxUser.setLoginLocation(AddressUtils.getRealAddressByIP(ip));
        wxUser.setBrowser(userAgent.getBrowser().getName());
        wxUser.setOs(userAgent.getOperatingSystem().getName());
    }

    /**
     * 从令牌中获取用户身份信息
     *
     * @param token 令牌
     * @return 用户信息
     */
    public WxUser getUser(String token) {
        if (StringUtils.isNotEmpty(token)) {
            Claims claims = parseToken(token);
            String uuid = (String) claims.get(Constants.LOGIN_USER_KEY);
            String userKey = Constants.LOGIN_TOKEN_KEY + uuid;
            return redisCache.getCacheObject(userKey);
        }
        return null;
    }

    /**
     * 获取请求token
     *
     * @param request
     * @return token
     */
    private String getToken(HttpServletRequest request) {
        String token = request.getHeader(header);
        if (StringUtils.isNotEmpty(token) && token.startsWith(Constants.TOKEN_PREFIX)) {
            token = token.replace(Constants.TOKEN_PREFIX, "");
        }
        return token;
    }

    private String getTokenKey(String uuid) {
        return Constants.LOGIN_TOKEN_KEY + uuid;
    }
}
