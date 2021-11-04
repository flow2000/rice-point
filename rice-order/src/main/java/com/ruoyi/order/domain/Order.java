package com.ruoyi.order.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单对象 rice_order
 * 
 * @author panghai
 * @date 2021-11-04
 */
public class Order extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单id */
    private Long orderId;

    /** 取餐号码 */
    @Excel(name = "取餐号码")
    private String orderCode;

    /** 就餐食堂id */
    private Long canteenId;

    /** 订单价格合计 */
    private BigDecimal orderPrice;

    /** 订单状态（0待支付 1已支付 2已取消） */
    @Excel(name = "订单状态", readConverterExp = "0=待支付,1=已支付,2=已取消")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setOrderId(Long orderId) 
    {
        this.orderId = orderId;
    }

    public Long getOrderId() 
    {
        return orderId;
    }
    public void setOrderCode(String orderCode) 
    {
        this.orderCode = orderCode;
    }

    public String getOrderCode() 
    {
        return orderCode;
    }
    public void setCanteenId(Long canteenId) 
    {
        this.canteenId = canteenId;
    }

    public Long getCanteenId() 
    {
        return canteenId;
    }
    public void setOrderPrice(BigDecimal orderPrice) 
    {
        this.orderPrice = orderPrice;
    }

    public BigDecimal getOrderPrice() 
    {
        return orderPrice;
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
            .append("orderId", getOrderId())
            .append("orderCode", getOrderCode())
            .append("canteenId", getCanteenId())
            .append("orderPrice", getOrderPrice())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createTime", getCreateTime())
            .toString();
    }
}
