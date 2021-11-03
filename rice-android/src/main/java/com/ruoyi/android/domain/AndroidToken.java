package com.ruoyi.android.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 *  安卓令牌实体类
 *
 */
public class AndroidToken extends BaseEntity {

    /** 用户id */
    private Long userId;

    /** 刷新令牌 */
    private String refreshToken;

    /** 访问令牌 */
    private String accessToken;

    /** 刷新令牌有效期 */
    private Long refreshTokenExpiresIn;

    /** 访问令牌有效期 */
    private int accessTokenExpiresIn;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public Long getRefreshTokenExpiresIn() {
        return refreshTokenExpiresIn;
    }

    public void setRefreshTokenExpiresIn(Long refreshTokenExpiresIn) {
        this.refreshTokenExpiresIn = refreshTokenExpiresIn;
    }

    public int getAccessTokenExpiresIn() {
        return accessTokenExpiresIn;
    }

    public void setAccessTokenExpiresIn(int accessTokenExpiresIn) {
        this.accessTokenExpiresIn = accessTokenExpiresIn;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "AndroidToken{" +
                "userId=" + userId +
                ", refreshToken='" + refreshToken + '\'' +
                ", accessToken='" + accessToken + '\'' +
                ", refreshTokenExpiresIn=" + refreshTokenExpiresIn +
                ", accessTokenExpiresIn=" + accessTokenExpiresIn +
                ", createTime=" + createTime +
                '}';
    }
}
