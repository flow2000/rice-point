package com.ruoyi.canteen.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.canteen.mapper.CanteenMapper;
import com.ruoyi.canteen.domain.Canteen;
import com.ruoyi.canteen.service.ICanteenService;

/**
 * 食堂信息Service业务层处理
 *
 * @author panghai
 * @date 2021-10-06
 */
@Service
public class CanteenServiceImpl implements ICanteenService
{
    @Autowired
    private CanteenMapper canteenMapper;

    /**
     * 查询食堂信息
     *
     * @param canteenId 食堂信息主键
     * @return 食堂信息
     */
    @Override
    public Canteen selectCanteenByCanteenId(Long canteenId)
    {
        return canteenMapper.selectCanteenByCanteenId(canteenId);
    }

    /**
     * 查询食堂信息列表
     *
     * @param canteen 食堂信息
     * @return 食堂信息
     */
    @Override
    public List<Canteen> selectCanteenList(Canteen canteen)
    {
        return canteenMapper.selectCanteenList(canteen);
    }

    /**
     * 新增食堂信息
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    @Override
    public int insertCanteen(Canteen canteen)
    {
        canteen.setCreateTime(DateUtils.getNowDate());
        return canteenMapper.insertCanteen(canteen);
    }

    /**
     * 修改食堂信息
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    @Override
    public int updateCanteen(Canteen canteen)
    {
        canteen.setUpdateTime(DateUtils.getNowDate());
        return canteenMapper.updateCanteen(canteen);
    }

    /**
     * 批量删除食堂信息
     *
     * @param canteenIds 需要删除的食堂信息主键
     * @return 结果
     */
    @Override
    public int deleteCanteenByCanteenIds(Long[] canteenIds)
    {
        return canteenMapper.deleteCanteenByCanteenIds(canteenIds);
    }

    /**
     * 删除食堂信息信息
     *
     * @param canteenId 食堂信息主键
     * @return 结果
     */
    @Override
    public int deleteCanteenByCanteenId(Long canteenId)
    {
        return canteenMapper.deleteCanteenByCanteenId(canteenId);
    }

    /**
     * 修改食堂状态
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    @Override
    public int changeCanteenStatus(Canteen canteen) {
        canteen.setUpdateTime(DateUtils.getNowDate());
        return canteenMapper.updateCanteenStatus(canteen);
    }
}
