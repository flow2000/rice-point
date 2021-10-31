package com.ruoyi.android.mapper;

import com.ruoyi.android.domain.AndroidLoginBody;
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
}
