package com.ruoyi.order.service.impl;

import com.ruoyi.order.domain.DishOrder;
import com.ruoyi.order.mapper.DishOrderMapper;
import com.ruoyi.order.service.IDishOrderService;
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
public class DishOrderServiceImpl implements IDishOrderService
{
    @Autowired
    private DishOrderMapper dishOrderMapper;

    /**
     * 查询菜品订单
     *
     * @param orderId 菜品订单主键
     * @return 菜品订单
     */
    @Override
    public DishOrder selectDishOrderByOrderId(Long orderId)
    {
        return dishOrderMapper.selectDishOrderByOrderId(orderId);
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
        return dishOrderMapper.selectDishOrderList(dishOrder);
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
        return dishOrderMapper.insertDishOrder(dishOrder);
    }

    /**
     * 修改菜品订单
     *
     * @param dishOrder 菜品订单
     * @return 结果
     */
    @Override
    public int updateDishOrder(DishOrder dishOrder)
    {
        return dishOrderMapper.updateDishOrder(dishOrder);
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
        return dishOrderMapper.deleteDishOrderByOrderIds(orderIds);
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
        return dishOrderMapper.deleteDishOrderByOrderId(orderId);
    }
}
