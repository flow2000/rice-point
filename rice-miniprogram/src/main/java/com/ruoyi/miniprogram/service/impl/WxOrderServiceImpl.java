package com.ruoyi.miniprogram.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.miniprogram.mapper.WxDishOrderMapper;
import com.ruoyi.miniprogram.mapper.WxOrderMapper;
import com.ruoyi.miniprogram.service.IWxOrderService;
import com.ruoyi.order.domain.DishOrder;
import com.ruoyi.order.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * 订单Service业务层处理
 *
 * @author panghai
 * @date 2021-11-04
 */
@Service
public class WxOrderServiceImpl implements IWxOrderService {
    @Autowired
    private WxOrderMapper wxOrderMapper;

    @Autowired
    private WxDishOrderMapper wxDishOrderMapper;

    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    @Override
    public Order selectWxOrderByOrderId(Long orderId) {
        Order order = wxOrderMapper.selectOrderByOrderId(orderId);
        if (order != null) {
            DishOrder dishOrder = new DishOrder();
            dishOrder.setOrderId(orderId);
            order.setDishOrders(wxDishOrderMapper.selectDishOrderList(dishOrder));
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
    public List<Order> selectWxOrderList(Order order) {
        List<Order> list = wxOrderMapper.selectOrderList(order);
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                DishOrder dishOrder = new DishOrder();
                dishOrder.setOrderId(list.get(i).getOrderId());
                Order o = list.get(i);
                o.setDishOrders(wxDishOrderMapper.selectDishOrderList(dishOrder));
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
    public int insertWxOrder(Order order) {
        List<DishOrder> dishOrders = order.getDishOrders();
        double sum = 0;
        if (order.getErrorReason() == null) {
            order.setErrorReason("");
        }
        // 计算总价
        for (DishOrder d : dishOrders) {
            sum += d.getPrice();
        }
        // 设置订单初始值
        order.setOrderPrice(new BigDecimal(String.valueOf(sum)));
        order.setCreateTime(DateUtils.getNowDate());
        order.setOrderCode(IdUtils.generateOrderID(order.getUserId()));
        order.setMealNumber(selectLastMealNumberInToday() + 1);
        // 插入订单数据
        int row = wxOrderMapper.insertOrder(order);
        for (int i = 0; i < dishOrders.size(); i++) {
            DishOrder dishOrder = dishOrders.get(i);
            dishOrder.setOrderId(order.getOrderId());
            dishOrders.set(i, dishOrder);
        }
        try{
            if (row > 0) {
                // 插入菜品订单数据
                wxDishOrderMapper.insertDishOrders(dishOrders);
            }
        }catch(Exception e){
            wxOrderMapper.deleteOrderByOrderId(order.getOrderId());
        }
        return row;
    }

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteWxOrderByOrderIds(Long[] orderIds) {
        // 删除菜品订单
        wxDishOrderMapper.deleteDishOrderByOrderIds(orderIds);
        return wxOrderMapper.deleteOrderByOrderIds(orderIds);
    }

    /**
     * 删除订单信息
     *
     * @param orderId 订单主键
     * @return 结果
     */
    @Override
    public int deleteWxOrderByOrderId(Long orderId) {
        // 删除菜品订单
        wxDishOrderMapper.deleteDishOrderByOrderId(orderId);
        return wxOrderMapper.deleteOrderByOrderId(orderId);
    }

    /**
     * 查询订单中今天最后一个取餐号
     *
     * @return 结果
     */
    private int selectLastMealNumberInToday() {
        Order order = wxOrderMapper.selectLastMealNumberInToday();
        if (order == null) {
            return 0;
        }
        return order.getMealNumber();
    }

}
