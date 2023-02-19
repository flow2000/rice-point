package com.ruoyi.miniprogram.mapper;

import com.ruoyi.dish.domain.CanteenDishType;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/02/19
 * @Description: 食堂菜品类型Mapper
 */
public interface WxCanteenDishTypeMapper {

    /**
     * 查询食堂菜品类型
     *
     * @param canteenDishType 食堂菜品类型
     */
    public List<CanteenDishType> selectCanteenDishType(CanteenDishType canteenDishType);
}
