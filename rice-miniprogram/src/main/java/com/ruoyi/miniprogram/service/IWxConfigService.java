package com.ruoyi.miniprogram.service;

import java.util.List;
import com.ruoyi.miniprogram.domain.WxConfig;

/**
 * 微信小程序配置Service接口
 * 
 * @author panghai
 * @date 2023-02-08
 */
public interface IWxConfigService 
{
    /**
     * 查询微信小程序配置
     * 
     * @param id 微信小程序配置主键
     * @return 微信小程序配置
     */
    public WxConfig selectWxConfigById(Long id);

    /**
     * 查询微信小程序配置列表
     * 
     * @param wxConfig 微信小程序配置
     * @return 微信小程序配置集合
     */
    public List<WxConfig> selectWxConfigList(WxConfig wxConfig);

    /**
     * 新增微信小程序配置
     * 
     * @param wxConfig 微信小程序配置
     * @return 结果
     */
    public int insertWxConfig(WxConfig wxConfig);

    /**
     * 修改微信小程序配置
     * 
     * @param wxConfig 微信小程序配置
     * @return 结果
     */
    public int updateWxConfig(WxConfig wxConfig);

    /**
     * 批量删除微信小程序配置
     * 
     * @param ids 需要删除的微信小程序配置主键集合
     * @return 结果
     */
    public int deleteWxConfigByIds(Long[] ids);

    /**
     * 删除微信小程序配置信息
     * 
     * @param id 微信小程序配置主键
     * @return 结果
     */
    public int deleteWxConfigById(Long id);
}
