package com.ruoyi.dish.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dish.mapper.DishTypeMapper;
import com.ruoyi.dish.domain.DishType;
import com.ruoyi.dish.service.IDishTypeService;

/**
 * 菜品类型Service业务层处理
 *
 * @author panghai
 * @date 2021-10-19
 */
@Service
public class DishTypeServiceImpl implements IDishTypeService
{
    @Autowired
    private DishTypeMapper dishTypeMapper;

    /**
     * 查询菜品类型
     *
     * @param typeId 菜品类型主键
     * @return 菜品类型
     */
    @Override
    public DishType selectDishTypeByTypeId(Long typeId)
    {
        return dishTypeMapper.selectDishTypeByTypeId(typeId);
    }

    /**
     * 查询菜品类型列表
     *
     * @param dishType 菜品类型
     * @return 菜品类型
     */
    @Override
    public List<DishType> selectDishTypeList(DishType dishType)
    {
        return dishTypeMapper.selectDishTypeList(dishType);
    }

    /**
     * 新增菜品类型
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    @Override
    public int insertDishType(DishType dishType)
    {
        dishType.setCreateTime(DateUtils.getNowDate());
        return dishTypeMapper.insertDishType(dishType);
    }

    /**
     * 修改菜品类型
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    @Override
    public int updateDishType(DishType dishType)
    {
        dishType.setUpdateTime(DateUtils.getNowDate());
        return dishTypeMapper.updateDishType(dishType);
    }

    /**
     * 批量删除菜品类型
     *
     * @param typeIds 需要删除的菜品类型主键
     * @return 结果
     */
    @Override
    public int deleteDishTypeByTypeIds(Long[] typeIds)
    {
        return dishTypeMapper.deleteDishTypeByTypeIds(typeIds);
    }

    /**
     * 删除菜品类型信息
     *
     * @param typeId 菜品类型主键
     * @return 结果
     */
    @Override
    public int deleteDishTypeByTypeId(Long typeId)
    {
        return dishTypeMapper.deleteDishTypeByTypeId(typeId);
    }

    /**
     * 修改菜品类型状态
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    @Override
    public int changeTypeStatus(DishType dishType) {
        dishType.setUpdateTime(DateUtils.getNowDate());
        return dishTypeMapper.updateDishTypeStatus(dishType);
    }
}
