package com.ruoyi.order.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
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

    /** 用户id */
    private Long userId;

    /** 部门id */
    private Long deptId;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private String orderCode;

    /** 取餐号码 */
    @Excel(name = "取餐号码")
    private int mealNumber;

    /** 就餐食堂id */
    private Long canteenId;

    /** 就餐食堂名称 */
    private String canteenName;

    /** 就餐食堂图片 */
    private String canteenUrl;

    /** 菜品订单列表 */
    List<DishOrder> dishOrders;

    /** 订单价格合计 */
    @Excel(name = "总计")
    private BigDecimal orderPrice;

    /** 实付款 */
    @Excel(name = "实付款")
    private BigDecimal orderPaid;

    /** 订单状态（0未处理 1已完成 2处理失败 3已取消） */
    @Excel(name = "订单状态", readConverterExp = "0=未处理,1=已完成,2=处理失败,3=已取消")
    private String status;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 订单处理失败时给出理由 */
    @Excel(name = "失败理由")
    private String errorReason;

    /** 时间范围 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private List<Date> timeList;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public int getMealNumber() {
        return mealNumber;
    }

    public void setMealNumber(int mealNumber) {
        this.mealNumber = mealNumber;
    }

    public Long getCanteenId() {
        return canteenId;
    }

    public void setCanteenId(Long canteenId) {
        this.canteenId = canteenId;
    }

    public String getCanteenName() {
        return canteenName;
    }

    public void setCanteenName(String canteenName) {
        this.canteenName = canteenName;
    }

    public String getCanteenUrl() {
        return canteenUrl;
    }

    public void setCanteenUrl(String canteenUrl) {
        this.canteenUrl = canteenUrl;
    }

    public List<DishOrder> getDishOrders() {
        return dishOrders;
    }

    public void setDishOrders(List<DishOrder> dishOrders) {
        this.dishOrders = dishOrders;
    }

    public BigDecimal getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(BigDecimal orderPrice) {
        this.orderPrice = orderPrice;
    }

    public BigDecimal getOrderPaid() {
        return orderPaid;
    }

    public void setOrderPaid(BigDecimal orderPaid) {
        this.orderPaid = orderPaid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getErrorReason() {
        return errorReason;
    }

    public void setErrorReason(String errorReason) {
        this.errorReason = errorReason;
    }

    public List<Date> getTimeList() {
        return timeList;
    }

    public void setTimeList(List<Date> timeList) {
        this.timeList = timeList;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                "userId=" + userId +
                "deptId=" + deptId +
                ", orderCode='" + orderCode + '\'' +
                ", mealNumber=" + mealNumber +
                ", canteenId=" + canteenId +
                ", canteenName=" + canteenName +
                ", dishOrders=" + dishOrders +
                ", orderPrice=" + orderPrice +
                ", orderPaid=" + orderPaid +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", errorReason='" + errorReason + '\'' +
                ", timeList=" + timeList +
                '}';
    }
}
