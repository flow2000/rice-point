package com.ruoyi.canteen.mapper;

import java.util.List;
import com.ruoyi.canteen.domain.Canteen;

/**
 * 食堂信息Mapper接口
 *
 * @author panghai
 * @date 2021-10-06
 */
public interface CanteenMapper
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
     * 删除食堂信息
     *
     * @param canteenId 食堂信息主键
     * @return 结果
     */
    public int deleteCanteenByCanteenId(Long canteenId);

    /**
     * 批量删除食堂信息
     *
     * @param canteenIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCanteenByCanteenIds(Long[] canteenIds);

    /**
     * 修改食堂状态
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    public int updateCanteenStatus(Canteen canteen);

    /**
     * 校验饭堂名称是否唯一
     *
     * @param canteenName 饭堂名称
     * @return 结果
     */
    public int checkCanteenNameUnique(String canteenName);

    /**
     * 检查是否存在食堂和菜品类型关联
     *
     * @param canteenIds 饭堂id组
     * @return 结果
     */
    public int checkCanteenDishTypeByCanteenIds(Long[] canteenIds);

    /**
     * 检查是否存在食堂和菜品类型关联
     *
     * @param canteenId 饭堂id
     * @return 结果
     */
    public int checkCanteenDishTypeByCanteenId(Long canteenId);
}
