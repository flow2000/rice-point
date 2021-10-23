package com.ruoyi.dish.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 菜品对象 rice_dish
 *
 * @author panghai
 * @date 2021-10-23
 */
public class Dish extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 菜品id */
    private Long dishId;

    /** 菜品名称 */
    @Excel(name = "菜品名称")
    private String dishesName;

    /** 菜品类型 */
    @Excel(name = "菜品类型")
    private Long dishesType;

    /** 菜品图片 */
    @Excel(name = "菜品图片")
    private String url;

    /** 菜品价格 */
    @Excel(name = "菜品价格")
    private BigDecimal price;

    /** 月售量 */
    @Excel(name = "月售量")
    private Long onsale;

    /** 菜品状态（0正常 1停用） */
    @Excel(name = "菜品状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setDishId(Long dishId)
    {
        this.dishId = dishId;
    }

    public Long getDishId()
    {
        return dishId;
    }
    public void setDishesName(String dishesName)
    {
        this.dishesName = dishesName;
    }

    public String getDishesName()
    {
        return dishesName;
    }
    public void setDishesType(Long dishesType)
    {
        this.dishesType = dishesType;
    }

    public Long getDishesType()
    {
        return dishesType;
    }
    public void setUrl(String url)
    {
        this.url = url;
    }

    public String getUrl()
    {
        return url;
    }
    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public BigDecimal getPrice()
    {
        return price;
    }
    public void setOnsale(Long onsale)
    {
        this.onsale = onsale;
    }

    public Long getOnsale()
    {
        return onsale;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("dishId", getDishId())
            .append("dishesName", getDishesName())
            .append("dishesType", getDishesType())
            .append("url", getUrl())
            .append("price", getPrice())
            .append("onsale", getOnsale())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
