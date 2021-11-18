package com.ruoyi.system.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.SysLogininfor;
import com.ruoyi.system.mapper.SysLogininforMapper;
import com.ruoyi.system.service.ISysLogininforService;

/**
 * 系统访问日志情况信息 服务层处理
 *
 * @author ruoyi
 */
@Service
public class SysLogininforServiceImpl implements ISysLogininforService {

    @Autowired
    private SysLogininforMapper logininforMapper;

    /**
     * 新增系统登录日志
     *
     * @param logininfor 访问日志对象
     */
    @Override
    public void insertLogininfor(SysLogininfor logininfor) {
        logininforMapper.insertLogininfor(logininfor);
    }

    /**
     * 查询系统登录日志集合
     *
     * @param logininfor 访问日志对象
     * @return 登录记录集合
     */
    @Override
    public List<SysLogininfor> selectLogininforList(SysLogininfor logininfor) {
        return logininforMapper.selectLogininforList(logininfor);
    }

    /**
     * 批量删除系统登录日志
     *
     * @param infoIds 需要删除的登录日志ID
     * @return
     */
    @Override
    public int deleteLogininforByIds(Long[] infoIds) {
        return logininforMapper.deleteLogininforByIds(infoIds);
    }

    /**
     * 清空系统登录日志
     */
    @Override
    public void cleanLogininfor() {
        logininforMapper.cleanLogininfor();
    }

    /**
     * 查询系统访问人数(登录成功)
     *
     * @return 访问人数
     */
    @Override
    public int selectLogininforAmount() {
        return logininforMapper.selectLogininforAmount();
    }

    /**
     * 查询本周系统访问人数(登录成功人数)
     *
     * @return 本周访问人数数组
     */
    @Override
    public Map<String, Object> selectWeekLogininforMap() {
        List<Map<String, Object>> list = logininforMapper.selectWeekLogininforList();
        Map<String, Object> res = new HashMap<>();
        String[] t = new String[list.size()];
        Long[] a = new Long[list.size()];
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = list.get(i);
            t[i] = (String) map.get("loginTime");
            a[i] = (Long) map.get("amount");
        }
        res.put("legend", "访问人数");
        res.put("type", "line");
        res.put("xdata", t);
        res.put("ydata", a);
        return res;
    }
}
