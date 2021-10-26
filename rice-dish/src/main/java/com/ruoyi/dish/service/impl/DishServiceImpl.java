package com.ruoyi.dish.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.dish.constatnt.DishConstants;
import com.ruoyi.dish.domain.CanteenDish;
import com.ruoyi.dish.mapper.CanteenDishMapper;
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

    @Autowired
    private CanteenDishMapper canteenDishMapper;

    /**
     * 查询菜品
     *
     * @param dishId 菜品主键
     * @return 菜品
     */
    @Override
    public Dish selectDishByDishId(Long dishId)
    {
        Dish dish = dishMapper.selectDishByDishId(dishId);
        if (dish != null){
            CanteenDish canteenDish = new CanteenDish();
            canteenDish.setDishId(dishId);
            Long[] canteenIds = selectCanteenDishList(canteenDish);
            dish.setCanteenIds(canteenIds);
        }
        return dish;
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
        List<Dish> list = dishMapper.selectDishList(dish);
        if (list != null){
            for (int i = 0; i < list.size(); i++) {
                Long dish_id = list.get(i).getDishId();
                CanteenDish canteenDish = new CanteenDish();
                canteenDish.setDishId(dish_id);
                Long[] canteenIds = selectCanteenDishList(canteenDish);
                Dish d = list.get(i);
                d.setCanteenIds(canteenIds);
                list.set(i,d);
            }
        }
        return list;
    }

    /**
     * 查询食堂菜品列表
     *
     * @param canteenDish 菜品类型
     * @return 菜品类型
     */
    private Long[] selectCanteenDishList(CanteenDish canteenDish){
        List<CanteenDish> list = canteenDishMapper.selectCanteenDish(canteenDish);
        if (list!=null) {
            Long[] canteenIds = new Long[list.size()];
            for (int i = 0; i < list.size(); i++) {
                canteenIds[i] = list.get(i).getCanteenId();
            }
            return canteenIds;
        }
        return null;
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
        // 新增食堂菜品关联
        insertCanteenDish(dish);
        return rows;
    }

    /**
     * 新增食堂菜品关联
     *
     * @param dish 菜品对象
     */
    private void insertCanteenDish(Dish dish) {
        Long[] canteenIds = dish.getCanteenIds();
        if (StringUtils.isNotNull(canteenIds))
        {
            List<CanteenDish> list = new ArrayList<CanteenDish>();
            for (Long canteenId : canteenIds)
            {
                CanteenDish cd = new CanteenDish();
                cd.setDishId(dish.getDishId());
                cd.setCanteenId(canteenId);
                list.add(cd);
            }
            if (list.size() > 0)
            {
                canteenDishMapper.batchCanteenDish(list);
            }
        }
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
        Long dishId = dish.getDishId();
        //删除食堂菜品关联
        canteenDishMapper.deleteCanteenDishByDishId(dishId);
        // 新增食堂菜品关联
        insertCanteenDish(dish);
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
        //删除食堂菜品关联
        canteenDishMapper.deleteCanteenDishByDishIds(dishIds);
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
        //删除食堂菜品关联
        canteenDishMapper.deleteCanteenDishByDishId(dishId);
        return dishMapper.deleteDishByDishId(dishId);
    }

    /**
     * 校验菜品名称是否唯一
     *
     * @param dish 菜品
     * @return 结果
     */
    @Override
    public String checkDishesNameUnique(Dish dish) {
        int count = dishMapper.checkDishUnique(dish);
        if (count > 0)
        {
            return DishConstants.UNIQUE;
        }
        return DishConstants.NOT_UNIQUE;
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
