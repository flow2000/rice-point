package com.ruoyi.miniprogram.service.impl;

import com.ruoyi.dish.domain.CanteenDish;
import com.ruoyi.dish.domain.Dish;
import com.ruoyi.miniprogram.mapper.WxCanteenDishMapper;
import com.ruoyi.miniprogram.mapper.WxDishMapper;
import com.ruoyi.miniprogram.service.IWxDishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/02/18
 * @Description: 菜品信息Service业务层处理
 */
@Service
public class WxDishServiceImpl implements IWxDishService {

    @Autowired
    private WxDishMapper wxDishMapper;

    @Autowired
    private WxCanteenDishMapper wxCanteenDishMapper;

    /**
     * 查询菜品
     *
     * @param dishId 菜品主键
     * @return 菜品
     */
    @Override
    public Dish selectDishByDishId(Long dishId) {
        Dish dish = wxDishMapper.selectWxDishByDishId(dishId);
        if (dish != null) {
            CanteenDish canteenDish = new CanteenDish();
            canteenDish.setDishId(dishId);
            Long[] canteenIds = selectCanteenDishList(canteenDish);
            dish.setCanteenIds(canteenIds);
        }
        return dish;
    }

    /**
     * 查询食堂菜品列表
     *
     * @param canteenDish 菜品类型
     * @return 菜品类型
     */
    private Long[] selectCanteenDishList(CanteenDish canteenDish){
        List<CanteenDish> list = wxCanteenDishMapper.selectWxCanteenDish(canteenDish);
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
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品
     */
    @Override
    public List<Dish> selectDishList(Dish dish) {
        return wxDishMapper.selectWxDishList(dish);
    }
}
