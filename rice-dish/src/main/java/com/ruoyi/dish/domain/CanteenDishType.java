package com.ruoyi.dish.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 食堂和菜品类型关联 rice_canteen_dish_type
 *
 * @author panghai
 * @date 2021-10-24
 */
public class CanteenDishType {

    /** 菜品类型id */
    private Long typeId;

    /** 食堂id */
    private Long canteenId;

    public void setTypeId(Long typeId)
    {
        this.typeId = typeId;
    }

    public Long getTypeId()
    {
        return typeId;
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
                .append("typeId", getTypeId())
                .append("canteenId", getCanteenId())
                .toString();
    }
}
