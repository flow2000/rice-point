package com.ruoyi.miniprogram.mapper;

import com.ruoyi.dish.domain.DishType;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/02/19
 * @Description: 菜品类型Mapper接口
 */
public interface WxDishTypeMapper {

    /**
     * 查询菜品类型
     *
     * @param typeId 菜品类型主键
     * @return 菜品类型
     */
    public DishType selectDishTypeByTypeId(Long typeId);

    /**
     * 查询菜品类型列表
     *
     * @param dishType 菜品类型
     * @return 菜品类型集合
     */
    public List<DishType> selectDishTypeList(DishType dishType);
}
