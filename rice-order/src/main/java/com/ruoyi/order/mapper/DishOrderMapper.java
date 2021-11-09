package com.ruoyi.order.mapper;

import com.ruoyi.order.domain.DishOrder;

import java.util.List;

/**
 * 菜品订单Mapper接口
 *
 * @author panghai
 * @date 2021-11-07
 */
public interface DishOrderMapper
{
    /**
     * 查询菜品订单
     *
     * @param orderId 菜品订单主键
     * @return 菜品订单
     */
    public DishOrder selectDishOrderByOrderId(Long orderId);

    /**
     * 查询菜品订单列表
     *
     * @param dishOrder 菜品订单
     * @return 菜品订单集合
     */
    public List<DishOrder> selectDishOrderList(DishOrder dishOrder);

    /**
     * 新增菜品订单
     *
     * @param dishOrder 菜品订单
     * @return 结果
     */
    public int insertDishOrder(DishOrder dishOrder);

    /**
     * 批量新增菜品订单
     *
     * @return 结果
     */
    public void insertDishOrders(List<DishOrder> dishOrders);


    /**
     * 修改菜品订单
     *
     * @param dishOrder 菜品订单
     * @return 结果
     */
    public int updateDishOrder(DishOrder dishOrder);

    /**
     * 删除菜品订单
     *
     * @param orderId 菜品订单主键
     * @return 结果
     */
    public int deleteDishOrderByOrderId(Long orderId);

    /**
     * 批量删除菜品订单
     *
     * @param orderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDishOrderByOrderIds(Long[] orderIds);

}
