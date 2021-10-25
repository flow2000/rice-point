package com.ruoyi.dish.service;

import java.util.List;
import com.ruoyi.dish.domain.DishType;

/**
 * 菜品类型Service接口
 *
 * @author panghai
 * @date 2021-10-19
 */
public interface IDishTypeService
{
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

    /**
     * 新增菜品类型
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    public int insertDishType(DishType dishType);

    /**
     * 修改菜品类型
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    public int updateDishType(DishType dishType);

    /**
     * 批量删除菜品类型
     *
     * @param typeIds 需要删除的菜品类型主键集合
     * @return 结果
     */
    public int deleteDishTypeByTypeIds(Long[] typeIds);

    /**
     * 删除菜品类型信息
     *
     * @param typeId 菜品类型主键
     * @return 结果
     */
    public int deleteDishTypeByTypeId(Long typeId);

    /**
     * 修改菜品类型状态
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    public int changeTypeStatus(DishType dishType);

    /**
     * 校验菜品类型名称是否唯一
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    public String checkDishTypeNameUnique(DishType dishType);
}
