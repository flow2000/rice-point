package com.ruoyi.canteen.service;

import java.util.List;
import com.ruoyi.canteen.domain.Canteen;
import com.ruoyi.canteen.domain.CanteenTreeSelect;

/**
 * 食堂信息Service接口
 *
 * @author panghai
 * @date 2021-10-06
 */
public interface ICanteenService
{
    /**
     * 查询食堂信息
     *
     * @param canteenId 食堂信息主键
     * @return 食堂信息
     */
    public Canteen selectCanteenByCanteenId(Long canteenId);

    /**
     * 查询食堂信息列表
     *
     * @param canteen 食堂信息
     * @return 食堂信息集合
     */
    public List<Canteen> selectCanteenList(Canteen canteen);

    /**
     * 新增食堂信息
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    public int insertCanteen(Canteen canteen);

    /**
     * 修改食堂信息
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    public int updateCanteen(Canteen canteen);

    /**
     * 批量删除食堂信息
     *
     * @param canteenIds 需要删除的食堂信息主键集合
     * @return 结果
     */
    public int deleteCanteenByCanteenIds(Long[] canteenIds);

    /**
     * 删除食堂信息信息
     *
     * @param canteenId 食堂信息主键
     * @return 结果
     */
    public int deleteCanteenByCanteenId(Long canteenId);

    /**
     * 修改食堂状态
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    public int changeCanteenStatus(Canteen canteen);

    /**
     * 校验食堂名称是否唯一
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    public String checkCanteenNameUnique(Canteen canteen);

    /**
     * 校验食堂信息添加/修改规则
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    public String checkPassRules(Canteen canteen);

    /**
     * 检查是否存在食堂和菜品类型关联
     *
     * @param canteenIds 食堂id组
     * @return 结果
     */
    public String checkCanteenDishTypeByCanteenIds(Long[] canteenIds);

    /**
     * 检查是否存在食堂和菜品类型关联
     *
     * @param canteenId 食堂id组
     * @return 结果
     */
    public String checkCanteenDishTypeByCanteenId(Long canteenId);

    /**
     * 获取食堂下拉树列表
     * @return
     */
    public List<CanteenTreeSelect> buildCanteenTreeSelect(List<Canteen> canteens);
}
