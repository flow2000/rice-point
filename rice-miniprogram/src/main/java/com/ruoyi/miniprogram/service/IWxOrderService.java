package com.ruoyi.miniprogram.service;

import com.ruoyi.order.domain.Order;

import java.util.List;

/**
 *
 * @author panghai
 * @date 2021-11-04
 * @Description: 订单Service接口
 */
public interface IWxOrderService
{
    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    public Order selectWxOrderByOrderId(Long orderId);

    /**
     * 查询订单列表
     *
     * @param order 订单
     * @return 订单集合
     */
    public List<Order> selectWxOrderList(Order order);

    /**
     * 新增订单
     *
     * @param order 订单
     * @return 结果
     */
    public int insertWxOrder(Order order);

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的订单主键集合
     * @return 结果
     */
    public int deleteWxOrderByOrderIds(Long[] orderIds);

    /**
     * 删除订单信息
     *
     * @param orderId 订单主键
     * @return 结果
     */
    public int deleteWxOrderByOrderId(Long orderId);


}
