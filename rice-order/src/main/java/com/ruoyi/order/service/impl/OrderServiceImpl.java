package com.ruoyi.order.service.impl;

import java.util.List;

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
        return orderMapper.selectOrderByOrderId(orderId);
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
        if (list != null){
            for (int i = 0; i < list.size(); i++) {
                DishOrder dishOrder = new DishOrder();
                dishOrder.setOrderId(list.get(i).getOrderId());
                Order o = list.get(i);
                o.setDishOrders(dishOrderMapper.selectDishOrderList(dishOrder));
                list.set(i,o);
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
        if (order.getErrorReason()==null){
            order.setErrorReason("");
        }
        order.setCreateTime(DateUtils.getNowDate());
        order.setOrderCode(IdUtils.fastSimpleUUID());
        order.setMealNumber(selectLastMealNumberInToday() + 1);
        int row = orderMapper.insertOrder(order);
        dishOrderMapper.insertDishOrders(dishOrders);
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
        if (order.getErrorReason()==null){
            order.setErrorReason("");
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
    private int selectLastMealNumberInToday(){
        Order order = orderMapper.selectLastMealNumberInToday();
        if (order == null){
            return 0;
        }
        return order.getMealNumber();
    }
}
