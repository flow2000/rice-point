package com.ruoyi.dish.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.dish.constatnt.DishConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dish.mapper.DishMapper;
import com.ruoyi.dish.domain.Dish;
import com.ruoyi.dish.service.IDishService;

/**
 * 菜品Service业务层处理
 *
 * @author panghai
 * @date 2021-10-23
 */
@Service
public class DishServiceImpl implements IDishService
{
    @Autowired
    private DishMapper dishMapper;

    /**
     * 查询菜品
     *
     * @param dishId 菜品主键
     * @return 菜品
     */
    @Override
    public Dish selectDishByDishId(Long dishId)
    {
        return dishMapper.selectDishByDishId(dishId);
    }

    /**
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品
     */
    @Override
    public List<Dish> selectDishList(Dish dish)
    {
        return dishMapper.selectDishList(dish);
    }

    /**
     * 新增菜品
     *
     * @param dish 菜品
     * @return 结果
     */
    @Override
    public int insertDish(Dish dish)
    {
        dish.setCreateTime(DateUtils.getNowDate());
        int rows = dishMapper.insertDish(dish);
        // 新增食堂菜品类型关联
        insertCanteenDish(dish);
        return rows;
    }

    /**
     * 新增食堂菜品关联
     *
     * @param dish 菜品对象
     */
    private void insertCanteenDish(Dish dish) {

    }

    /**
     * 修改菜品
     *
     * @param dish 菜品
     * @return 结果
     */
    @Override
    public int updateDish(Dish dish)
    {
        dish.setUpdateTime(DateUtils.getNowDate());
        return dishMapper.updateDish(dish);
    }

    /**
     * 批量删除菜品
     *
     * @param dishIds 需要删除的菜品主键
     * @return 结果
     */
    @Override
    public int deleteDishByDishIds(Long[] dishIds)
    {
        return dishMapper.deleteDishByDishIds(dishIds);
    }

    /**
     * 删除菜品信息
     *
     * @param dishId 菜品主键
     * @return 结果
     */
    @Override
    public int deleteDishByDishId(Long dishId)
    {
        return dishMapper.deleteDishByDishId(dishId);
    }

    /**
     * 校验菜品名称是否唯一
     *
     * @param dishesName 菜品名称
     * @return 结果
     */
    @Override
    public String checkDishesNameUnique(String dishesName) {
        int count = dishMapper.checkDishTypeNameUnique(dishesName);
        if (count > 0)
        {
            return DishConstants.NOT_UNIQUE;
        }
        return DishConstants.UNIQUE;
    }

    /**
     * 修改菜品状态
     *
     * @param dish 菜品
     * @return 结果
     */
    @Override
    public int changeDishStatus(Dish dish) {
        dish.setUpdateTime(DateUtils.getNowDate());
        return dishMapper.updateDishStatus(dish);
    }
}
