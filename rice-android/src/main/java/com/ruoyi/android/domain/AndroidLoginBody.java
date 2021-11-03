package com.ruoyi.android.domain;


import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 安卓登录参数实体类
 */
public class AndroidLoginBody extends BaseEntity {

    /** 用户名 */
    private String userName;

    /** 密码 */
    private String password;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "LoginBody{" +
                "userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
