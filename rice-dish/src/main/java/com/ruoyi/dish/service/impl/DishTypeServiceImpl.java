package com.ruoyi.dish.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.dish.constatnt.DishTypeConstants;
import com.ruoyi.dish.domain.CanteenDishType;
import com.ruoyi.dish.mapper.CanteenDishTypeMapper;
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

    @Autowired
    private CanteenDishTypeMapper canteenDishTypeMapper;

    /**
     * 查询菜品类型
     *
     * @param typeId 菜品类型主键
     * @return 菜品类型
     */
    @Override
    @DataScope(deptAlias = "d")
    public DishType selectDishTypeByTypeId(Long typeId)
    {
        DishType dishType = dishTypeMapper.selectDishTypeByTypeId(typeId);
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
    @DataScope(deptAlias = "d")
    public List<DishType> selectDishTypeList(DishType dishType)
    {
        List<DishType> list = dishTypeMapper.selectDishTypeList(dishType);
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
        List<CanteenDishType> list = canteenDishTypeMapper.selectCanteenDishType(canteenDishType);
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
     * 新增菜品类型
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    @Override
    public int insertDishType(DishType dishType)
    {
        dishType.setCreateTime(DateUtils.getNowDate());
        Long deptId = SecurityUtils.getLoginUser().getDeptId();
        dishType.setDeptId(deptId);
        int rows = dishTypeMapper.insertDishType(dishType);
        // 新增食堂菜品类型关联
        insertCanteenDishType(dishType);
        return rows;
    }

    /**
     * 新增食堂菜品类型
     *
     * @param dishType 菜品类型
     */
    private void insertCanteenDishType(DishType dishType) {
        Long [] canteenIds = dishType.getCanteenIds();
        if (StringUtils.isNotNull(canteenIds))
        {
            // 新增食堂菜品类型
            List<CanteenDishType> list = new ArrayList<CanteenDishType>();
            for (Long canteenId : canteenIds)
            {
                CanteenDishType cd = new CanteenDishType();
                cd.setTypeId(dishType.getTypeId());
                cd.setCanteenId(canteenId);
                list.add(cd);
            }
            if (list.size() > 0)
            {
                canteenDishTypeMapper.batchCanteenDishType(list);
            }
        }
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
        Long typeId = dishType.getTypeId();
        //删除食堂菜品类型关联
        canteenDishTypeMapper.deleteCanteenDishTypeByTypeId(typeId);
        // 新增食堂菜品类型关联
        insertCanteenDishType(dishType);
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
        //批量删除食堂菜品类型
        canteenDishTypeMapper.deleteCanteenDishTypeByTypeIds(typeIds);
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
        //删除食堂菜品类型
        canteenDishTypeMapper.deleteCanteenDishTypeByTypeId(typeId);
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

    /**
     * 校验菜品类型名称是否唯一
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    @Override
    public String checkDishTypeNameUnique(DishType dishType) {
        int count = dishTypeMapper.checkDishTypeUnique(dishType);
        if (count > 0)
        {
            return DishTypeConstants.UNIQUE;
        }
        return DishTypeConstants.NOT_UNIQUE;
    }
}
