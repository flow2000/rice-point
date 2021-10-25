package com.ruoyi.dish.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 食堂和菜品关联 rice_canteen_dish
 *
 * @author panghai
 * @date 2021-10-25
 */
public class CanteenDish {

    /** 菜品id */
    private Long dishId;

    /** 食堂id */
    private Long canteenId;

    public void setDishId(Long dishId)
    {
        this.dishId = dishId;
    }

    public Long getDishId()
    {
        return dishId;
    }
    public void setCanteenId(Long canteenId)
    {
        this.canteenId = canteenId;
    }

    public Long getCanteenId()
    {
        return canteenId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("dishId", getDishId())
                .append("canteenId", getCanteenId())
                .toString();
    }
}
