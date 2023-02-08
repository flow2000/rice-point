package com.ruoyi.miniprogram.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * 微信小程序配置对象 rice_wx_config
 *
 * @author panghai
 * @date 2023-02-08
 */
public class WxConfig extends BaseEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 唯一标识
     */
    private Long id;

    /**
     * appid
     */
    @Excel(name = "appid")
    private String appId;

    /**
     * 访问token
     */
    @Excel(name = "访问token")
    private String token;

    /**
     * 名称
     */
    @Excel(name = "名称")
    private String appName;

    /**
     * 头像
     */
    @Excel(name = "头像")
    private String headImg;

    /**
     * 主体名称
     */
    @Excel(name = "主体名称")
    private String principalName;

    /**
     * 功能介绍
     */
    @Excel(name = "功能介绍")
    private String signature;

    /**
     * 状态（0正常 1停用）
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getAppId() {
        return appId;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getAppName() {
        return appName;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setPrincipalName(String principalName) {
        this.principalName = principalName;
    }

    public String getPrincipalName() {
        return principalName;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getSignature() {
        return signature;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("appId", getAppId())
                .append("token", getToken())
                .append("appName", getAppName())
                .append("headImg", getHeadImg())
                .append("principalName", getPrincipalName())
                .append("signature", getSignature())
                .append("status", getStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
