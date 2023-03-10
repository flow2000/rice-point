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

    /** 部门id */
    private Long deptId;

    /** 菜品类型id */
    private Long typeId;

    /** 所属食堂id */
    private Long canteenId;

    /** 菜品名称 */
    @Excel(name = "菜品名称")
    private String dishesName;

    /** 菜品类型 */
    @Excel(name = "菜品类型")
    private String dishesType;

    /** 菜品图片 */
    private String url;

    /** 菜品价格 */
    @Excel(name = "菜品价格")
    private BigDecimal price;

    /** 月售量 */
    @Excel(name = "月售量")
    private int onsale;

    /** 菜品状态（0正常 1停用） */
    @Excel(name = "菜品状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 菜品id组 */
    private Long[] dishIds;

    /** 食堂组 */
    private Long[] canteenIds;

    /** 上架日期 */
    private String shelfDate;

    /** 特定上架日期 */
    private int oneShelfDate;

    private int time;

    private String typeName;

    public void setDishId(Long dishId)
    {
        this.dishId = dishId;
    }

    public Long getDishId()
    {
        return dishId;
    }
    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Long getDeptId() {
        return deptId;
    }
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
    public void setDishesName(String dishesName)
    {
        this.dishesName = dishesName;
    }

    public String getDishesName()
    {
        return dishesName;
    }
    public void setDishesType(String dishesType)
    {
        this.dishesType = dishesType;
    }

    public String getDishesType()
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
    public void setOnsale(int onsale)
    {
        this.onsale = onsale;
    }

    public int getOnsale()
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
    public Long[] getDishIds() {
        return dishIds;
    }

    public void setDishIds(Long[] dishIds) {
        this.dishIds = dishIds;
    }

    public void setCanteenIds(Long[] canteenIds)
    {
        this.canteenIds=canteenIds;
    }

    public Long[] getCanteenIds()
    {
        return canteenIds;
    }
    public void setShelfDate(String shelfDate) {
        this.shelfDate = shelfDate;
    }

    public String getShelfDate() {
        return shelfDate;
    }
    public void setOneShelfDate(int oneShelfDate) {
        this.oneShelfDate = oneShelfDate;
    }

    public int getOneShelfDate() {
        return oneShelfDate;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("dishId", getDishId())
            .append("deptId", getDeptId())
            .append("typeId", getTypeId())
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
            .append("dishIds",getDishIds())
            .append("canteenIds",getCanteenIds())
            .append("shelfDate",getShelfDate())
            .append("oneShelfDate",getOneShelfDate())
            .toString();
    }
}
