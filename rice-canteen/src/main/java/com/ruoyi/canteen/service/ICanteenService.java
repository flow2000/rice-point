package com.ruoyi.canteen.service;

import java.util.List;
import com.ruoyi.canteen.domain.Canteen;

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
}
