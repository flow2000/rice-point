package com.ruoyi.ticket.domain;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 菜品投票信息对象 DishTicket
 *
 * @author panghai
 * @date 2021-11-10
 */
public class DishTicket extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 菜品名称 */
    private String dishesName;

    /** 菜品url */
    private String url;

    public String getDishesName() {
        return dishesName;
    }

    public void setDishesName(String dishesName) {
        this.dishesName = dishesName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "DishTicket{" +
                "dishesName='" + dishesName + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
