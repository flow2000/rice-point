package com.ruoyi.miniprogram.service;

import com.ruoyi.dish.domain.DishType;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/02/19
 * @Description: 菜品类型Service接口
 */
public interface IWxDishTypeService {

    /**
     * 查询菜品类型
     *
     * @param typeId 菜品类型主键
     * @return 菜品类型
     */
    public DishType selectWxDishTypeByTypeId(Long typeId);

    /**
     * 查询菜品类型列表
     *
     * @param dishType 菜品类型
     * @return 菜品类型集合
     */
    public List<DishType> selectWxDishTypeList(DishType dishType);
}
