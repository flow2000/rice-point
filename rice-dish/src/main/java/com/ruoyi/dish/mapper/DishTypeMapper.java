package com.ruoyi.dish.mapper;

import java.util.List;
import com.ruoyi.dish.domain.DishType;

/**
 * 菜品类型Mapper接口
 *
 * @author panghai
 * @date 2021-10-19
 */
public interface DishTypeMapper
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
     * 删除菜品类型
     *
     * @param typeId 菜品类型主键
     * @return 结果
     */
    public int deleteDishTypeByTypeId(Long typeId);

    /**
     * 批量删除菜品类型
     *
     * @param typeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDishTypeByTypeIds(Long[] typeIds);

    /**
     * 修改菜品类型状态
     *
     * @param dishType 菜品类型
     * @return 结果
     */
    public int updateDishTypeStatus(DishType dishType);

    /**
     * 校验菜品类型名称是否唯一
     *
     * @param typeName 菜品类型名称
     * @return 结果
     */
    public int checkDishTypeNameUnique(String typeName);
}
