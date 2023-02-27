package com.ruoyi.miniprogram.mapper;

import java.util.List;

import com.ruoyi.miniprogram.domain.WxHome;

/**
 * 轮播图Mapper接口
 *
 * @author panghai
 * @date 2023-02-26
 */
public interface WxHomeMapper {
    /**
     * 查询轮播图
     *
     * @param id 轮播图主键
     * @return 轮播图
     */
    public WxHome selectWxHomeByAppid(Long id);

    /**
     * 查询轮播图列表
     *
     * @param wxHome 轮播图
     * @return 轮播图集合
     */
    public List<WxHome> selectWxHomeList(WxHome wxHome);

    /**
     * 新增轮播图
     *
     * @param wxHome 轮播图
     * @return 结果
     */
    public int insertWxHome(WxHome wxHome);

    /**
     * 修改轮播图
     *
     * @param wxHome 轮播图
     * @return 结果
     */
    public int updateWxHome(WxHome wxHome);

    /**
     * 删除轮播图
     *
     * @param id 轮播图主键
     * @return 结果
     */
    public int deleteWxHomeById(Long id);

    /**
     * 批量删除轮播图
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxHomeByIds(Long[] ids);
}
