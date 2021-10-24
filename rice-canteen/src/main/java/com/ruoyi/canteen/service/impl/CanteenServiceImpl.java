package com.ruoyi.canteen.service.impl;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.ruoyi.canteen.constant.CanteenConstants;
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
public class CanteenServiceImpl implements ICanteenService {
    @Autowired
    private CanteenMapper canteenMapper;

    /**
     * 查询食堂信息
     *
     * @param canteenId 食堂信息主键
     * @return 食堂信息
     */
    @Override
    public Canteen selectCanteenByCanteenId(Long canteenId) {
        return canteenMapper.selectCanteenByCanteenId(canteenId);
    }

    /**
     * 查询食堂信息列表
     *
     * @param canteen 食堂信息
     * @return 食堂信息
     */
    @Override
    public List<Canteen> selectCanteenList(Canteen canteen) {
        return canteenMapper.selectCanteenList(canteen);
    }

    /**
     * 新增食堂信息
     *
     * @param canteen 食堂信息
     * @return 结果
     */
    @Override
    public int insertCanteen(Canteen canteen) {
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
    public int updateCanteen(Canteen canteen) {
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
    public int deleteCanteenByCanteenIds(Long[] canteenIds) {
        return canteenMapper.deleteCanteenByCanteenIds(canteenIds);
    }

    /**
     * 删除食堂信息信息
     *
     * @param canteenId 食堂信息主键
     * @return 结果
     */
    @Override
    public int deleteCanteenByCanteenId(Long canteenId) {
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

    /**
     * 校验饭堂名称是否唯一
     *
     * @param canteenName 饭堂名称
     * @return 结果
     */
    @Override
    public String checkCanteenNameUnique(String canteenName) {
        int count = canteenMapper.checkCanteenNameUnique(canteenName);
        if (count > 0) {
            return CanteenConstants.NOT_UNIQUE;
        }
        return CanteenConstants.UNIQUE;
    }

    /**
     * 校验饭堂信息添加/修改规则
     *
     * @param canteen 饭堂信息
     * @return 结果
     */
    @Override
    public String checkPassRules(Canteen canteen) {
        int length = canteen.getCanteenName().length();
        if (length < CanteenConstants.CANTEENNAME_MIN_LENGTH || length > CanteenConstants.CANTEENNAME_MAX_LENGTH) {
            return CanteenConstants.NOT_PASS_RULES;
        }
        Pattern pattern = Pattern.compile("^(0\\.\\d{0,1}[1-9]|\\+?[1-9][0-9]{0,3})(\\.\\d{1,2})?$"); // 判断小数点后2位的数字的正则表达式
        Matcher match = pattern.matcher(canteen.getAverage().toString());
        if (!match.matches()) {
            return CanteenConstants.NOT_PASS_RULES;
        }
        return CanteenConstants.PASS_RULES;
    }

}
