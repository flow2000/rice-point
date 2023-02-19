package com.ruoyi.miniprogram.mapper;

import com.ruoyi.dish.domain.CanteenDish;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/02/18
 * @Description: 食堂菜品关联
 */
public interface WxCanteenDishMapper {

    /**
     * 查询食堂菜品列表
     *
     * @param canteenDish 菜品类型
     * @return 菜品类型
     */
    public List<CanteenDish> selectWxCanteenDish(CanteenDish canteenDish);
}
