package com.ruoyi.dish.service.impl;

import java.util.*;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.dish.constatnt.DishConstants;
import com.ruoyi.dish.domain.CanteenDish;
import com.ruoyi.dish.domain.DishType;
import com.ruoyi.dish.mapper.CanteenDishMapper;
import com.ruoyi.dish.mapper.DishTypeMapper;
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

    @Autowired
    private DishTypeMapper dishTypeMapper;

    /**
     * 查询菜品
     *
     * @param dishId 菜品主键
     * @return 菜品
     */
    @Override
    @DataScope(deptAlias = "d")
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
    @DataScope(deptAlias = "d")
    public List<Dish> selectDishList(Dish dish)
    {
        return dishMapper.selectDishList(dish);
    }

    /**
     * 查询今日上架菜品列表
     *
     * @param dish 菜品
     * @return 菜品集合
     */
    @Override
    @DataScope(deptAlias = "d")
    public List<Object> selectTodayDishList(Dish dish) {
        // 定义结果数组
        List<Object> list = new ArrayList<>();
        List<Dish> dishList = dishMapper.selectTodayDishList(dish);
        // 获取菜品类型信息
        List<DishType> dishTypeList = dishTypeMapper.selectDishTypeList(new DishType());
        for (DishType dishType : dishTypeList){
            List<Dish> l = new ArrayList<>();
            Iterator<Dish> iterator = dishList.iterator();
            while (iterator.hasNext()){
                Dish d = iterator.next();
                if (dishType.getTypeId().equals(d.getTypeId())){ //类型相同
                    l.add(d);
                    iterator.remove(); // 移除该元素
                }
            }
            if (l.size()!=0){
                Map<String, Object> map = new HashMap<>();
                map.put("typeName", dishType.getTypeName());
                map.put("dishList", l);
                list.add(map);
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
    @DataScope(deptAlias = "d")
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
        Long deptId = SecurityUtils.getLoginUser().getDeptId();
        dish.setDeptId(deptId);
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

    /**
     * 上架菜品
     *
     * @param dish 菜品
     * @return 结果
     */
    @Override
    public int uploadDish(Dish dish) {
        return dishMapper.updateDishByDishId(dish);
    }

    /**
     * 批量上架菜品
     *
     * @param dish 菜品
     * @return 结果
     */
    @Override
    public int uploadDishes(Dish dish) {
        return dishMapper.updateDishByDishIds(dish);
    }
}
