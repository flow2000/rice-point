package com.ruoyi.miniprogram.service;

import com.ruoyi.dish.domain.Dish;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/02/18
 * @Description: 菜品Service接口
 */
public interface IWxDishService {

    /**
     * 查询菜品
     *
     * @param dishId 菜品主键
     * @return 菜品
     */
    public Dish selectDishByDishId(Long dishId);

    /**
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品集合
     */
    public List<Dish> selectDishList(Dish dish);
}
