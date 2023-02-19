package com.ruoyi.miniprogram.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.miniprogram.config.MiniprogramConfig;
import com.ruoyi.miniprogram.constant.WxAPI;
import com.ruoyi.miniprogram.constant.WxUserType;
import com.ruoyi.miniprogram.domain.model.WxLoginResult;
import com.ruoyi.miniprogram.service.WxTokenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.ruoyi.miniprogram.mapper.WxUserMapper;
import com.ruoyi.miniprogram.domain.WxUser;
import com.ruoyi.miniprogram.service.IWxUserService;

import javax.annotation.Resource;

/**
 * 微信用户Service业务层处理
 *
 * @author panghai
 * @date 2023-02-08
 */
@Service
public class WxUserServiceImpl implements IWxUserService {
    @Resource
    private WxUserMapper wxUserMapper;

    @Resource
    private MiniprogramConfig miniprogramConfig;

    @Resource
    private WxTokenService wxTokenService;

    Logger log = LoggerFactory.getLogger(WxUserServiceImpl.class);

    /**
     * 微信小程序登录
     *
     * @param appid appid
     * @param code  wx.login()方法得到的code
     * @return 登录结果
     */
    @Override
    public AjaxResult login(String appid, String code) {
        // 构造微信登录对象
        HashMap<String, Object> params = new HashMap<>(4);
        params.put("appid", appid);
        params.put("secret", miniprogramConfig.getSecret());
        params.put("js_code", code);
        params.put("grant_type", "authorization_code");

        // 向微信登录API发送登录请求
        String str = HttpUtil.get(WxAPI.WXLOGINAPI, params);

        // 构造微信登录结果对象
        WxLoginResult wxLoginResult = JSONObject.parseObject(str, WxLoginResult.class);

        if (wxLoginResult.getOpenId() == null) {
            throw new ServiceException(str);
        }

        // 构造微信用户对象
        WxUser wxUser = new WxUser();
        wxUser.setWxappId(miniprogramConfig.getAppId());
        wxUser.setUnionid(wxLoginResult.getUnionId());
        wxUser.setOpenId(wxLoginResult.getOpenId());
        wxUser.setUserType(WxUserType.MINIPROGRAM);
        wxUser.setLoginDate(new Date());
        wxUser.setPassword(miniprogramConfig.getAppId());


        String openId = wxUser.getOpenId();

        WxUser wu = wxUserMapper.selectWxUserByOpenId(openId);
        // 查询是否已注册过微信用户
        if (wu == null) {
            // 注册微信用户
            int row = wxUserMapper.insertWxUser(wxUser);
            // 注册失败抛出错误
            if (row == 0) {
                throw new ServiceException("微信用户:" + openId + "注册失败，请稍后重试");
            }
        } else {
            wxUser = wu;
        }

        // 构造token
        String token = wxTokenService.createToken(wxUser);

        // 构造返回数据
        JSONObject res = createLoginSuccessData(wxLoginResult, token, wxUser);
        return AjaxResult.success(res);
    }

    /**
     * 构造登陆成功返回的数据
     *
     * @param wxLoginResult 微信登录结果对象
     * @param token         令牌
     * @param user          登录用户
     * @return JSONObject对象
     */
    private JSONObject createLoginSuccessData(WxLoginResult wxLoginResult, String token, WxUser user) {
        JSONObject res = new JSONObject();
        res.put("appid", miniprogramConfig.getAppId());
        res.put("unionid", wxLoginResult.getUnionId());
        res.put("openid", wxLoginResult.getOpenId());
        res.put("session_key", wxLoginResult.getSessionKey());
        res.put("token", token);
        res.put("user", user);
        return res;
    }

    /**
     * 查询微信用户
     *
     * @param id 微信用户主键
     * @return 微信用户
     */
    @Override
    public WxUser selectWxUserById(Long id) {
        return wxUserMapper.selectWxUserById(id);
    }

    /**
     * 查询微信用户列表
     *
     * @param wxUser 微信用户
     * @return 微信用户
     */
    @Override
    public List<WxUser> selectWxUserList(WxUser wxUser) {
        return wxUserMapper.selectWxUserList(wxUser);
    }

    /**
     * 新增微信用户
     *
     * @param wxUser 微信用户
     * @return 结果
     */
    @Override
    public int insertWxUser(WxUser wxUser) {
        return wxUserMapper.insertWxUser(wxUser);
    }

    /**
     * 修改微信用户
     *
     * @param wxUser 微信用户
     * @return 结果
     */
    @Override
    public int updateWxUser(WxUser wxUser) {
        return wxUserMapper.updateWxUser(wxUser);
    }

    /**
     * 批量删除微信用户
     *
     * @param ids 需要删除的微信用户主键
     * @return 结果
     */
    @Override
    public int deleteWxUserByIds(Long[] ids) {
        return wxUserMapper.deleteWxUserByIds(ids);
    }

    /**
     * 删除微信用户信息
     *
     * @param id 微信用户主键
     * @return 结果
     */
    @Override
    public int deleteWxUserById(Long id) {
        return wxUserMapper.deleteWxUserById(id);
    }
}
