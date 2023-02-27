package com.ruoyi.miniprogram.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.miniprogram.mapper.WxHomeMapper;
import com.ruoyi.miniprogram.domain.WxHome;
import com.ruoyi.miniprogram.service.IWxHomeService;

/**
 * 轮播图Service业务层处理
 *
 * @author panghai
 * @date 2023-02-26
 */
@Service
public class WxHomeServiceImpl implements IWxHomeService {
    @Autowired
    private WxHomeMapper wxHomeMapper;

    /**
     * 查询轮播图
     *
     * @param appid 轮播图主键
     * @return 轮播图
     */
    @Override
    public WxHome selectWxHomeByAppid(Long appid) {
        return wxHomeMapper.selectWxHomeByAppid(appid);
    }

    /**
     * 查询轮播图列表
     *
     * @param wxHome 轮播图
     * @return 轮播图
     */
    @Override
    public List<WxHome> selectWxHomeList(WxHome wxHome) {
        return wxHomeMapper.selectWxHomeList(wxHome);
    }

    /**
     * 新增轮播图
     *
     * @param wxHome 轮播图
     * @return 结果
     */
    @Override
    public int insertWxHome(WxHome wxHome) {
        return wxHomeMapper.insertWxHome(wxHome);
    }

    /**
     * 修改轮播图
     *
     * @param wxHome 轮播图
     * @return 结果
     */
    @Override
    public int updateWxHome(WxHome wxHome) {
        return wxHomeMapper.updateWxHome(wxHome);
    }

    /**
     * 批量删除轮播图
     *
     * @param appids 需要删除的轮播图主键
     * @return 结果
     */
    @Override
    public int deleteWxHomeByIds(Long[] appids) {
        return wxHomeMapper.deleteWxHomeByIds(appids);
    }

    /**
     * 删除轮播图信息
     *
     * @param appid 轮播图主键
     * @return 结果
     */
    @Override
    public int deleteWxHomeById(Long appid) {
        return wxHomeMapper.deleteWxHomeById(appid);
    }
}
