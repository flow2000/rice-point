package com.ruoyi.miniprogram.mapper;

import com.ruoyi.dish.domain.Dish;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/02/18
 * @Description: 菜品Mapper接口
 */
public interface WxDishMapper {

    /**
     * 查询菜品
     *
     * @param dishId 菜品主键
     * @return 菜品
     */
    public Dish selectWxDishByDishId(Long dishId);

    /**
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品集合
     */
    public List<Dish> selectWxDishList(Dish dish);

}
