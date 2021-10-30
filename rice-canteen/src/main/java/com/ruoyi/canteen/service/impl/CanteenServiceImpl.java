package com.ruoyi.canteen.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import com.ruoyi.canteen.constant.CanteenConstants;
import com.ruoyi.canteen.domain.CanteenTreeSelect;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
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
     * @param canteen 饭堂名称
     * @return 结果
     */
    @Override
    public String checkCanteenNameUnique(Canteen canteen) {
        int count = canteenMapper.checkCanteenUnique(canteen);
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
        if (canteen.getAverage()!=null){
            Matcher match = pattern.matcher(canteen.getAverage().toString());
            if (!match.matches()) {
                return CanteenConstants.NOT_PASS_RULES;
            }
        }
        return CanteenConstants.PASS_RULES;
    }

    /**
     * 检查是否存在食堂和菜品类型关联
     *
     * @param canteenIds 饭堂id组
     * @return 结果
     */
    @Override
    public String checkCanteenDishTypeByCanteenIds(Long[] canteenIds) {
        int count = canteenMapper.checkCanteenDishTypeByCanteenIds(canteenIds);
        if (count > 0) {
            return CanteenConstants.EXIST;
        }
        return CanteenConstants.NOT_EXIST;
    }

    /**
     * 检查是否存在食堂和菜品类型关联
     *
     * @param canteenId 食堂id
     * @return 结果
     */
    @Override
    public String checkCanteenDishTypeByCanteenId(Long canteenId) {
        int count = canteenMapper.checkCanteenDishTypeByCanteenId(canteenId);
        if (count > 0) {
            return CanteenConstants.EXIST;
        }
        return CanteenConstants.NOT_EXIST;
    }

    /**
     * 检查是否存在食堂和菜品关联
     *
     * @param canteenIds 食堂id组
     * @return 结果
     */
    @Override
    public String checkCanteenDishByCanteenIds(Long[] canteenIds) {
        int count = canteenMapper.checkCanteenDishByCanteenIds(canteenIds);
        if (count > 0) {
            return CanteenConstants.EXIST;
        }
        return CanteenConstants.NOT_EXIST;
    }

    /**
     * 检查是否存在食堂和菜品关联
     *
     * @param canteenId 食堂id
     * @return 结果
     */
    @Override
    public String checkCanteenDishByCanteenId(Long canteenId) {
        int count = canteenMapper.checkCanteenDishByCanteenId(canteenId);
        if (count > 0) {
            return CanteenConstants.EXIST;
        }
        return CanteenConstants.NOT_EXIST;
    }


    /**
     * 获取食堂下拉树列表
     * @return 食堂下拉树列表
     */
    @Override
    public List<CanteenTreeSelect> buildCanteenTreeSelect(List<Canteen> canteens) {
        List<Canteen> canteenTrees = buildDeptTree(canteens);
        return  canteenTrees.stream().map(CanteenTreeSelect::new).collect(Collectors.toList());
    }

    /**
     * 构建前端所需要树结构
     *
     * @param canteens 部门列表
     * @return 树结构列表
     */
    public List<Canteen> buildDeptTree(List<Canteen> canteens)
    {
        List<Canteen> returnList = new ArrayList<Canteen>();
        List<Long> tempList = new ArrayList<Long>();
        for (Canteen canteen : canteens)
        {
            tempList.add(canteen.getCanteenId());
        }
        for (Iterator<Canteen> iterator = canteens.iterator(); iterator.hasNext();)
        {
            Canteen canteen = (Canteen) iterator.next();
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(canteen.getParentId()))
            {
                recursionFn(canteens, canteen);
                returnList.add(canteen);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = canteens;
        }
        return returnList;
    }

    /**
     * 递归列表
     */
    private void recursionFn(List<Canteen> list, Canteen t)
    {
        // 得到子节点列表
        List<Canteen> childList = getChildList(list, t);
        t.setChildren(childList);
        for (Canteen tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<Canteen> list, Canteen t)
    {
        return getChildList(list, t).size() > 0;
    }

    /**
     * 得到子节点列表
     */
    private List<Canteen> getChildList(List<Canteen> list, Canteen t)
    {
        List<Canteen> tlist = new ArrayList<Canteen>();
        Iterator<Canteen> it = list.iterator();
        while (it.hasNext())
        {
            Canteen n = (Canteen) it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getCanteenId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }
}
