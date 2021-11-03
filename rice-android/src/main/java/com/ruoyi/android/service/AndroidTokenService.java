package com.ruoyi.android.service;

import com.ruoyi.android.domain.AndroidToken;
import com.ruoyi.android.domain.AndroidUser;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
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
 * 安卓token验证处理
 *
 * @author panghai
 */
@Component
public class AndroidTokenService {

    @Autowired
    private RedisCache redisCache;

    // 令牌自定义标识
    @Value("${token.header}")
    private String header;

    // 令牌秘钥
    @Value("${token.secret}")
    private String secret;

    // 访问令牌有效期（默认1天，单位：秒）
    private final int accessTokenExpiresIn = 24 * 60 * 60;

    // 刷新令牌有效期（默认30天，单位：秒）
    private final Long refreshTokenExpiresIn = 30 * 24 * 60 * 60L;

    protected static final long MILLIS_SECOND = 1000;

    protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;

    private static final Long MILLIS_MINUTE_TEN = 20 * 60 * 1000L;

    /**
     * 创建令牌
     *
     * @param androidUser 用户信息
     * @return 令牌
     */
    public AndroidToken createToken(AndroidUser androidUser) {

        AndroidToken androidToken = new AndroidToken();

        androidToken.setAccessToken(createAccessToken(androidUser));
        androidToken.setAccessTokenExpiresIn(accessTokenExpiresIn);

        return androidToken;
    }

    /**
     * 创建刷新令牌
     *
     * @return 刷新令牌
     */
    public String createRefreshToken() {
        String refreshToken = IdUtils.fastUUID();
        Map<String, Object> claims = new HashMap<>();
        claims.put(Constants.LOGIN_USER_KEY, refreshToken);
        return createToken(claims);
    }

    /**
     * 创建访问令牌
     *
     * @param androidUser 用户信息
     * @return 访问令牌
     */
    public String createAccessToken(AndroidUser androidUser) {
        String accessToken = IdUtils.fastUUID();
        androidUser.setAccessToken(accessToken);
        refreshToken(androidUser);
        Map<String, Object> claims = new HashMap<>();
        claims.put(Constants.LOGIN_USER_KEY, accessToken);
        return createToken(claims);
    }

    /**
     * 验证令牌有效期，相差不足20分钟，自动刷新缓存
     *
     * @param androidUser 用户信息
     *
     */
    public void verifyToken(AndroidUser androidUser)
    {
        long expireTime = androidUser.getExpireTime();
        long currentTime = System.currentTimeMillis();
        if (expireTime - currentTime <= MILLIS_MINUTE_TEN)
        {
            refreshToken(androidUser);
        }
    }

    /**
     * 从数据声明生成令牌
     *
     * @param claims 数据声明
     * @return 令牌
     */
    private String createToken(Map<String, Object> claims)
    {
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
    private Claims parseToken(String token)
    {
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 刷新令牌有效期
     *
     * @param androidUser 登录信息
     */
    public void refreshToken(AndroidUser androidUser)
    {
        String AccessKey = getTokenKey(androidUser.getAccessToken());

        redisCache.setCacheObject(AccessKey, androidUser, accessTokenExpiresIn, TimeUnit.SECONDS);
    }

    /**
     * 获取请求token
     *
     * @param request 请求
     * @return token
     */
    private String getToken(HttpServletRequest request)
    {
        String token = request.getHeader(header);
        if (StringUtils.isNotEmpty(token) && token.startsWith(Constants.TOKEN_PREFIX))
        {
            token = token.replace(Constants.TOKEN_PREFIX, "");
        }
        return token;
    }

    private String getTokenKey(String uuid)
    {
        return Constants.LOGIN_TOKEN_KEY + uuid;
    }

    /**
     * 获取刷新令牌有效期
     * @return 刷新令牌有效期
     */
    public Long getRefreshTokenExpiresIn(){
        return refreshTokenExpiresIn;
    }
}
