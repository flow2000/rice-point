package com.ruoyi.order.mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.ruoyi.order.domain.Order;

/**
 * 订单Mapper接口
 *
 * @author panghai
 * @date 2021-11-04
 */
public interface OrderMapper
{
    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    public Order selectOrderByOrderId(Long orderId);

    /**
     * 查询订单列表
     *
     * @param order 订单
     * @return 订单集合
     */
    public List<Order> selectOrderList(Order order);

    /**
     * 新增订单
     *
     * @param order 订单
     * @return 结果
     */
    public int insertOrder(Order order);

    /**
     * 修改订单
     *
     * @param order 订单
     * @return 结果
     */
    public int updateOrder(Order order);

    /**
     * 删除订单
     *
     * @param orderId 订单主键
     * @return 结果
     */
    public int deleteOrderByOrderId(Long orderId);

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrderByOrderIds(Long[] orderIds);

    /**
     * 查询订单中今天最后一个取餐号
     *
     * @return 结果
     */
    public Order selectLastMealNumberInToday();

    /**
     * 查询订单总量
     *
     * @return 结果
     */
    public int selectOrderAmount();

    /**
     * 查询订单交易额
     *
     * @return 结果
     */
    public BigDecimal selectOrderMoneyAmount();

    /**
     * 查询每周订单量
     *
     * @return 结果
     */
    public List<Map<String, Object>> selectWeekOrderAmount();

    /**
     * 查询每周订单交易额
     *
     * @return 结果
     */
    public List<Map<String, Object>> selectWeekOrderMoneyAmount();

    /**
     * 增加订单对应菜品的月售量
     *
     * @param order 订单
     */
    public void updateDishOnsale(Order order);

    /**
     * 获取订单详细信息
     *
     * @return 结果
     */
    public List<Order> listUserOrder(Order order);
}
