package com.ruoyi.miniprogram.domain.model;

import java.io.Serializable;

/**
 * @Author: panghai
 * @Date: 2023/02/07
 * @Description: 微信小程序登录结果对象
 * 详情：https://developers.weixin.qq.com/miniprogram/dev/OpenApiDoc/user-login/code2Session.html
 */
public class WxLoginResult implements Serializable {

    /**
     * 用户唯一标识
     */
    private String openid;

    /**
     * 会话密钥
     */
    private String session_key;

    /**
     * 用户在开放平台的唯一标识符，若当前小程序已绑定到微信开放平台帐号下会返回
     * 详见 https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/union-id.html
     */
    private String unionid;

    /**
     * 错误码
     */
    private Integer errcode;

    /**
     * 错误信息
     */
    private String errmsg;

    public String getOpenId() {
        return openid;
    }

    public void setOpenId(String openid) {
        this.openid = openid;
    }

    public String getSessionKey() {
        return session_key;
    }

    public void setSessionKey(String session_key) {
        this.session_key = session_key;
    }

    public String getUnionId() {
        return unionid;
    }

    public void setUnionId(String unionid) {
        this.unionid = unionid;
    }

    public Integer getErrCode() {
        return errcode;
    }

    public void setErrCode(Integer errcode) {
        this.errcode = errcode;
    }

    public String getErrMsg() {
        return errmsg;
    }

    public void setErrMsg(String errmsg) {
        this.errmsg = errmsg;
    }
}
