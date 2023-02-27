package com.ruoyi.miniprogram.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 轮播图对象 rice_wx_home
 *
 * @author panghai
 * @date 2023-02-26
 */
public class WxHome extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Long id;

    /**
     * appid
     */
    @Excel(name = "appid")
    private String appid;

    /**
     * 图片地址
     */
    @Excel(name = "图片地址")
    private String img;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getAppid() {
        return appid;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("appid", getAppid())
                .append("img", getImg())
                .toString();
    }
}
