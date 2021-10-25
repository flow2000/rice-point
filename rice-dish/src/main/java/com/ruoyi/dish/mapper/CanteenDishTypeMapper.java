package com.ruoyi.dish.mapper;

import com.ruoyi.dish.domain.CanteenDishType;

import java.util.List;

/**
 * 食堂菜品类型Mapper接口
 *
 * @author panghai
 * @date 2021-10-24
 */
public interface CanteenDishTypeMapper {

    /**
     * 新增食堂菜品类型
     *
     * @param list 食堂菜品类型对象
     */
    public void batchCanteenDishType(List<CanteenDishType> list);

    /**
     * 删除食堂菜品类型
     *
     * @param typeId 菜品类型id
     */
    public void deleteCanteenDishTypeByTypeId(Long typeId);

    /**
     * 批量删除食堂菜品类型
     *
     * @param typeId 菜品类型id
     */
    public void deleteCanteenDishTypeByTypeIds(Long[] typeId);

    /**
     * 查询食堂菜品类型
     *
     * @param canteenDishType 食堂菜品类型
     */
    public List<CanteenDishType> selectCanteenDishType(CanteenDishType canteenDishType);
}
