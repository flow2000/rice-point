package com.ruoyi.miniprogram.service.impl;

import com.ruoyi.miniprogram.mapper.WxDishOrderMapper;
import com.ruoyi.miniprogram.service.IWxDishOrderService;
import com.ruoyi.order.domain.DishOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 菜品订单Service业务层处理
 *
 * @author panghai
 * @date 2021-11-07
 */
@Service
public class WxDishOrderServiceImpl implements IWxDishOrderService
{
    @Autowired
    private WxDishOrderMapper wxDishOrderMapper;

    /**
     * 查询菜品订单
     *
     * @param orderId 菜品订单主键
     * @return 菜品订单
     */
    @Override
    public DishOrder selectDishOrderByOrderId(Long orderId)
    {
        return wxDishOrderMapper.selectDishOrderByOrderId(orderId);
    }

    /**
     * 查询菜品订单列表
     *
     * @param dishOrder 菜品订单
     * @return 菜品订单
     */
    @Override
    public List<DishOrder> selectDishOrderList(DishOrder dishOrder)
    {
        return wxDishOrderMapper.selectDishOrderList(dishOrder);
    }

    /**
     * 新增菜品订单
     *
     * @param dishOrder 菜品订单
     * @return 结果
     */
    @Override
    public int insertDishOrder(DishOrder dishOrder)
    {
        return wxDishOrderMapper.insertDishOrder(dishOrder);
    }

    /**
     * 批量删除菜品订单
     *
     * @param orderIds 需要删除的菜品订单主键
     * @return 结果
     */
    @Override
    public int deleteDishOrderByOrderIds(Long[] orderIds)
    {
        return wxDishOrderMapper.deleteDishOrderByOrderIds(orderIds);
    }

    /**
     * 删除菜品订单信息
     *
     * @param orderId 菜品订单主键
     * @return 结果
     */
    @Override
    public int deleteDishOrderByOrderId(Long orderId)
    {
        return wxDishOrderMapper.deleteDishOrderByOrderId(orderId);
    }
}
