package com.ruoyi.android.mapper;

import com.ruoyi.android.domain.AndroidLoginBody;
import com.ruoyi.android.domain.AndroidToken;
import com.ruoyi.android.domain.AndroidUser;

/**
 * 安卓登录Mapper接口
 *
 * @author panghai
 * @date 2021-10-31
 */
public interface AndroidLoginMapper {

    /**
     * app登录
     *
     * @param androidLoginBody 登录信息
     * @return 结果
     */
    public AndroidUser androidLogin(AndroidLoginBody androidLoginBody);

    /**
     * 保存刷新令牌
     * @param androidToken 令牌对象
     */
    public void insertRefreshToken(AndroidToken androidToken);

    /**
     * 更新刷新令牌
     * @param androidToken 令牌对象
     */
    public void updateRefreshToken(AndroidToken androidToken);

    /**
     * 删除刷新令牌
     * @param androidToken 令牌对象
     */
    public void deleteRefreshToken(AndroidToken androidToken);
}
