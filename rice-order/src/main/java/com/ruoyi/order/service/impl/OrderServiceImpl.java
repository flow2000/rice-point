package com.ruoyi.order.service.impl;

import java.math.BigDecimal;
import java.util.*;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.order.domain.DishOrder;
import com.ruoyi.order.mapper.DishOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.order.mapper.OrderMapper;
import com.ruoyi.order.domain.Order;
import com.ruoyi.order.service.IOrderService;

/**
 * 订单Service业务层处理
 *
 * @author panghai
 * @date 2021-11-04
 */
@Service
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private DishOrderMapper dishOrderMapper;

    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    @Override
    public Order selectOrderByOrderId(Long orderId) {
        Order order = orderMapper.selectOrderByOrderId(orderId);
        if (order != null) {
            DishOrder dishOrder = new DishOrder();
            dishOrder.setOrderId(orderId);
            order.setDishOrders(dishOrderMapper.selectDishOrderList(dishOrder));
        }
        return order;
    }

    /**
     * 查询订单列表
     *
     * @param order 订单
     * @return 订单
     */
    @Override
    public List<Order> selectOrderList(Order order) {
        List<Order> list = orderMapper.selectOrderList(order);
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                DishOrder dishOrder = new DishOrder();
                dishOrder.setOrderId(list.get(i).getOrderId());
                Order o = list.get(i);
                o.setDishOrders(dishOrderMapper.selectDishOrderList(dishOrder));
                list.set(i, o);
            }
        }
        return list;
    }

    /**
     * 新增订单
     *
     * @param order 订单
     * @return 结果
     */
    @Override
    public int insertOrder(Order order) {
        List<DishOrder> dishOrders = order.getDishOrders();
        double sum = 0;
        if (order.getErrorReason() == null) {
            order.setErrorReason("");
        }
        // 计算总价
        for (DishOrder d : dishOrders) {
            sum += d.getNumber() * d.getPrice();
        }
        // 设置订单初始值
        order.setOrderPrice(new BigDecimal(String.valueOf(sum)));
        order.setCreateTime(DateUtils.getNowDate());
        order.setOrderCode(IdUtils.generateOrderID(order.getUserId()));
        order.setMealNumber(selectLastMealNumberInToday() + 1);
        // 插入订单数据
        int row = orderMapper.insertOrder(order);
        for (int i = 0; i < dishOrders.size(); i++) {
            DishOrder dishOrder = dishOrders.get(i);
            dishOrder.setOrderId(order.getOrderId());
            dishOrders.set(i, dishOrder);
        }
        if (row > 0) {
            // 插入菜品订单数据
            dishOrderMapper.insertDishOrders(dishOrders);
        }
        return row;
    }

    /**
     * 修改订单
     *
     * @param order 订单
     * @return 结果
     */
    @Override
    public int updateOrder(Order order) {
        if (order.getErrorReason() == null) {
            order.setErrorReason("");
        }
        // 订单状态为成功写入实付款,增加对应菜品月售量
        if ("1".equals(order.getStatus())){
            order.setOrderPaid(order.getOrderPrice());
            // 增加订单对应菜品的月售量
            orderMapper.updateDishOnsale(order);
        }
        return orderMapper.updateOrder(order);
    }

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteOrderByOrderIds(Long[] orderIds) {
        // 删除菜品订单
        dishOrderMapper.deleteDishOrderByOrderIds(orderIds);
        return orderMapper.deleteOrderByOrderIds(orderIds);
    }

    /**
     * 删除订单信息
     *
     * @param orderId 订单主键
     * @return 结果
     */
    @Override
    public int deleteOrderByOrderId(Long orderId) {
        // 删除菜品订单
        dishOrderMapper.deleteDishOrderByOrderId(orderId);
        return orderMapper.deleteOrderByOrderId(orderId);
    }

    /**
     * 查询订单中今天最后一个取餐号
     *
     * @return 结果
     */
    private int selectLastMealNumberInToday() {
        Order order = orderMapper.selectLastMealNumberInToday();
        if (order == null) {
            return 0;
        }
        return order.getMealNumber();
    }

    /**
     * 查询订单总量
     *
     * @return 结果
     */
    @Override
    public int selectOrderAmount() {
        return orderMapper.selectOrderAmount();
    }

    /**
     * 查询订单交易额
     *
     * @return 结果
     */
    @Override
    public BigDecimal selectOrderMoneyAmount() {
        return orderMapper.selectOrderMoneyAmount();
    }

    /**
     * 查询每周订单量
     *
     * @return 结果
     */
    @Override
    public Map<String, Object> selectOrderWeekMap() {
        List<Map<String, Object>> list = orderMapper.selectWeekOrderAmount();
        Map<String, Object> res = new HashMap<>();
        String[] t = new String[list.size()];
        Long[] a = new Long[list.size()];
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = list.get(i);
            t[i] = (String) map.get("createTime");
            a[i] = (Long) map.get("amount");
        }
        res.put("legend", "订单数");
        res.put("type", "line");
        res.put("xdata", t);
        res.put("ydata", a);
        return res;
    }

    /**
     * 查询每周订单交易额
     *
     * @return 结果
     */
    @Override
    public Map<String, Object> selectWeekOrderMoneyMap() {
        List<Map<String, Object>> list = orderMapper.selectWeekOrderMoneyAmount();
        Map<String, Object> res = new HashMap<>();
        String[] t = new String[list.size()];
        BigDecimal[] a = new BigDecimal[list.size()];
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = list.get(i);
            t[i] = (String) map.get("createTime");
            a[i] = (BigDecimal) map.get("amount");
        }
        res.put("legend", "交易金额");
        res.put("type", "line");
        res.put("xdata", t);
        res.put("ydata", a);
        return res;
    }

    /**
     * 获取用户订单
     *
     * @return 结果
     */
    @Override
    public List<Order> listUserOrder(Order order) {
        List<Order> list = orderMapper.listUserOrder(order);
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                DishOrder dishOrder = new DishOrder();
                dishOrder.setOrderId(list.get(i).getOrderId());
                Order o = list.get(i);
                String s = o.getStatus();
                if ("0".equals(s)){
                    o.setStatus("未处理");
                }
                if ("1".equals(s)){
                    o.setStatus("已完成");
                }
                if ("2".equals(s)){
                    o.setStatus("处理失败");
                }
                if ("3".equals(s)){
                    o.setStatus("已取消");
                }
                o.setDishOrders(dishOrderMapper.selectDishOrderList(dishOrder));
                list.set(i, o);
            }
        }
        return list;
    }

}
