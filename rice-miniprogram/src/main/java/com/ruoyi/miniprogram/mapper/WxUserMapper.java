package com.ruoyi.miniprogram.mapper;

import java.util.List;

import com.ruoyi.miniprogram.domain.WxUser;

/**
 * 微信用户Mapper接口
 *
 * @author panghai
 * @date 2023-02-08
 */
public interface WxUserMapper {
    /**
     * 查询微信用户
     *
     * @param id 微信用户主键
     * @return 微信用户
     */
    public WxUser selectWxUserById(Long id);

    /**
     * 通过openid查询用户
     *
     * @param openid openid
     * @return 用户对象
     */
    public WxUser selectWxUserByOpenId(String openid);

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
     * 删除微信用户
     *
     * @param id 微信用户主键
     * @return 结果
     */
    public int deleteWxUserById(Long id);

    /**
     * 批量删除微信用户
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxUserByIds(Long[] ids);
}
