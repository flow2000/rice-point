package com.ruoyi.miniprogram.domain;

import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: panghai
 * @Date: 2023/03/10
 * @Description: 菜品投票类
 */
public class WxTicket extends BaseEntity implements Serializable {

    /**
     * 投票id
     */
    private Long ticketId;

    /**
     * 微信用户唯一标识
     */
    private String openId;

    /**
     * 菜品id
     */
    private Long dishId;

    /**
     * 期数
     */
    private int time;

    /**
     * 投票数
     */
    private int ticketNumber;

    /**
     * 创建时间
     */
    private Date createTime;

    private String dishName;

    private String url;

    private Long typeId;

    private String typeName;


    public Long getTicketId() {
        return ticketId;
    }

    public void setTicketId(Long ticketId) {
        this.ticketId = ticketId;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public Long getDishId() {
        return dishId;
    }

    public void setDishId(Long dishId) {
        this.dishId = dishId;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getTicketNumber() {
        return ticketNumber;
    }

    public void setTicketNumber(int ticketNumber) {
        this.ticketNumber = ticketNumber;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "WxTicket{" +
                "ticketId=" + ticketId +
                ", dishId=" + dishId +
                ", time=" + time +
                ", createTime=" + createTime +
                '}';
    }
}
