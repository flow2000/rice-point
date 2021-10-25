package com.ruoyi.dish.mapper;

import com.ruoyi.dish.domain.CanteenDish;

import java.util.List;

/**
 * 食堂菜品Mapper接口
 *
 * @author panghai
 * @date 2021-10-25
 */
public interface CanteenDishMapper {

    /**
     * 查询食堂菜品列表
     *
     * @param canteenDish 菜品类型
     * @return 菜品类型
     */
    public List<CanteenDish> selectCanteenDish(CanteenDish canteenDish);

    /**
     * 新增食堂菜品关联
     *
     * @param list 食堂菜品对象
     */
    public void batchCanteenDish(List<CanteenDish> list);

    /**
     * 删除食堂菜品关联
     *
     * @param dishId 菜品id
     */
    public void deleteCanteenDishByDishId(Long dishId);

    /**
     * 删除食堂菜品关联
     *
     * @param dishIds 菜品id组
     */
    public void deleteCanteenDishByDishIds(Long[] dishIds);
}
