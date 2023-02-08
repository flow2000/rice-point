package com.ruoyi.miniprogram.service;

import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.miniprogram.domain.WxUser;

/**
 * 微信用户Service接口
 *
 * @author panghai
 * @date 2023-02-08
 */
public interface IWxUserService {

    /**
     * 微信小程序登录
     *
     * @param appid appid
     * @param code  wx.login()方法得到的code
     * @return 登录结果
     */
    public AjaxResult login(String appid, String code);

    /**
     * 查询微信用户
     *
     * @param id 微信用户主键
     * @return 微信用户
     */
    public WxUser selectWxUserById(Long id);

    /**
     * 查询微信用户列表
     *
     * @param wxUser 微信用户
     * @return 微信用户集合
     */
    public List<WxUser> selectWxUserList(WxUser wxUser);

    /**
     * 新增微信用户
     *
     * @param wxUser 微信用户
     * @return 结果
     */
    public int insertWxUser(WxUser wxUser);

    /**
     * 修改微信用户
     *
     * @param wxUser 微信用户
     * @return 结果
     */
    public int updateWxUser(WxUser wxUser);

    /**
     * 批量删除微信用户
     *
     * @param ids 需要删除的微信用户主键集合
     * @return 结果
     */
    public int deleteWxUserByIds(Long[] ids);

    /**
     * 删除微信用户信息
     *
     * @param id 微信用户主键
     * @return 结果
     */
    public int deleteWxUserById(Long id);
}
