package com.ruoyi.dish.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 菜品类型对象 rice_dish_type
 *
 * @author panghai
 * @date 2021-10-19
 */
public class DishType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 菜品类型id */
    private Long typeId;

    /** 菜品类型 */
    @Excel(name = "菜品类型")
    private String typeName;

    /** 数据状态（0正常 1停用） */
    @Excel(name = "数据状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 食堂组 */
    private Long[] canteenIds;

    public void setTypeId(Long typeId)
    {
        this.typeId = typeId;
    }

    public Long getTypeId()
    {
        return typeId;
    }
    public void setTypeName(String typeName)
    {
        this.typeName = typeName;
    }

    public String getTypeName()
    {
        return typeName;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus() { return status; }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }
    public void setCanteenIds(Long[] canteenIds)
    {
        this.canteenIds=canteenIds;
    }

    public Long[] getCanteenIds()
    {
        return canteenIds;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("typeId", getTypeId())
            .append("typeName", getTypeName())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("canteenIds",getCanteenIds())
            .toString();
    }
}
