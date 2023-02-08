package com.ruoyi.miniprogram.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Author: panghai
 * @Date: 2023/02/07
 * @Description: 小程序配置
 */
@Component
@ConfigurationProperties(prefix = "miniprogram.configs.wx")
public class MiniprogramConfig {

    private String appId;

    private String secret;

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }
}
