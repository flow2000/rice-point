package com.ruoyi.android.domain;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 *  安卓令牌实体类
 *
 */
public class AndroidToken extends BaseEntity {

    /** 刷新令牌 */
    private String refreshToken;

    /** 访问令牌 */
    private String accessToken;

    /** 刷新令牌有效期 */
    private int refreshTokenExpiresIn;

    /** 访问令牌有效期 */
    private int accessTokenExpiresIn;

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

    public int getRefreshTokenExpiresIn() {
        return refreshTokenExpiresIn;
    }

    public void setRefreshTokenExpiresIn(int refreshTokenExpiresIn) {
        this.refreshTokenExpiresIn = refreshTokenExpiresIn;
    }

    public int getAccessTokenExpiresIn() {
        return accessTokenExpiresIn;
    }

    public void setAccessTokenExpiresIn(int accessTokenExpiresIn) {
        this.accessTokenExpiresIn = accessTokenExpiresIn;
    }

    @Override
    public String toString() {
        return "Token{" +
                "refreshToken='" + refreshToken + '\'' +
                ", accessToken='" + accessToken + '\'' +
                ", refreshTokenExpiresIn=" + refreshTokenExpiresIn +
                ", accessTokenExpiresIn=" + accessTokenExpiresIn +
                '}';
    }
}
