package com.ruoyi.miniprogram.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.miniprogram.mapper.WxConfigMapper;
import com.ruoyi.miniprogram.domain.WxConfig;
import com.ruoyi.miniprogram.service.IWxConfigService;

/**
 * 微信小程序配置Service业务层处理
 *
 * @author panghai
 * @date 2023-02-08
 */
@Service
public class WxConfigServiceImpl implements IWxConfigService {
    @Autowired
    private WxConfigMapper wxConfigMapper;

    /**
     * 查询微信小程序配置
     *
     * @param id 微信小程序配置主键
     * @return 微信小程序配置
     */
    @Override
    public WxConfig selectWxConfigById(Long id) {
        return wxConfigMapper.selectWxConfigById(id);
    }

    /**
     * 查询微信小程序配置列表
     *
     * @param wxConfig 微信小程序配置
     * @return 微信小程序配置
     */
    @Override
    public List<WxConfig> selectWxConfigList(WxConfig wxConfig) {
        return wxConfigMapper.selectWxConfigList(wxConfig);
    }

    /**
     * 新增微信小程序配置
     *
     * @param wxConfig 微信小程序配置
     * @return 结果
     */
    @Override
    public int insertWxConfig(WxConfig wxConfig) {
        wxConfig.setCreateTime(DateUtils.getNowDate());
        return wxConfigMapper.insertWxConfig(wxConfig);
    }

    /**
     * 修改微信小程序配置
     *
     * @param wxConfig 微信小程序配置
     * @return 结果
     */
    @Override
    public int updateWxConfig(WxConfig wxConfig) {
        wxConfig.setUpdateTime(DateUtils.getNowDate());
        return wxConfigMapper.updateWxConfig(wxConfig);
    }

    /**
     * 批量删除微信小程序配置
     *
     * @param ids 需要删除的微信小程序配置主键
     * @return 结果
     */
    @Override
    public int deleteWxConfigByIds(Long[] ids) {
        return wxConfigMapper.deleteWxConfigByIds(ids);
    }

    /**
     * 删除微信小程序配置信息
     *
     * @param id 微信小程序配置主键
     * @return 结果
     */
    @Override
    public int deleteWxConfigById(Long id) {
        return wxConfigMapper.deleteWxConfigById(id);
    }
}
