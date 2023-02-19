package com.ruoyi.miniprogram.service.impl;

import com.ruoyi.dish.domain.CanteenDishType;
import com.ruoyi.dish.domain.DishType;
import com.ruoyi.miniprogram.mapper.WxCanteenDishTypeMapper;
import com.ruoyi.miniprogram.mapper.WxDishTypeMapper;
import com.ruoyi.miniprogram.service.IWxDishTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/02/19
 * @Description:
 */
@Service
public class WxDishTypeServiceImpl implements IWxDishTypeService {

    @Autowired
    private WxDishTypeMapper WxDishTypeMapper;

    @Autowired
    private WxCanteenDishTypeMapper WxCanteenDishTypeMapper;

    /**
     * 查询菜品类型
     *
     * @param typeId 菜品类型主键
     * @return 菜品类型
     */
    @Override
    public DishType selectWxDishTypeByTypeId(Long typeId)
    {
        DishType dishType = WxDishTypeMapper.selectDishTypeByTypeId(typeId);
        if (dishType != null){
            Long type_id = dishType.getTypeId();
            CanteenDishType canteenDishType = new CanteenDishType();
            canteenDishType.setTypeId(type_id);
            Long[] canteenIds = selectCanteenDishTypeList(canteenDishType);
            dishType.setCanteenIds(canteenIds);
        }
        return dishType;
    }

    /**
     * 查询菜品类型列表
     *
     * @param dishType 菜品类型
     * @return 菜品类型
     */
    @Override
    public List<DishType> selectWxDishTypeList(DishType dishType)
    {
        List<DishType> list = WxDishTypeMapper.selectDishTypeList(dishType);
        if (list != null){
            for (int i = 0; i < list.size(); i++) {
                Long type_id = list.get(i).getTypeId();
                CanteenDishType canteenDishType = new CanteenDishType();
                canteenDishType.setTypeId(type_id);
                Long[] canteenIds = selectCanteenDishTypeList(canteenDishType);
                DishType dt = list.get(i);
                dt.setCanteenIds(canteenIds);
                list.set(i,dt);
            }
        }
        return list;
    }

    /**
     * 查询食堂菜品类型列表
     *
     * @param canteenDishType 菜品类型
     * @return 菜品类型
     */
    private Long[] selectCanteenDishTypeList(CanteenDishType canteenDishType){
        List<CanteenDishType> list = WxCanteenDishTypeMapper.selectCanteenDishType(canteenDishType);
        if (list!=null) {
            Long[] canteenIds = new Long[list.size()];
            for (int i = 0; i < list.size(); i++) {
                canteenIds[i] = list.get(i).getCanteenId();
            }
            return canteenIds;
        }
        return null;
    }
}
