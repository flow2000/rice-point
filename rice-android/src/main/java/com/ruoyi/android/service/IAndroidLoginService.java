package com.ruoyi.android.service;

import com.ruoyi.android.domain.AndroidLoginBody;
import com.ruoyi.android.domain.AndroidToken;

/**
 * 安卓登录Service接口
 *
 * @author panghai
 * @date 2021-10-31
 */
public interface IAndroidLoginService {


    /**
     * android登录
     *
     * @param androidLoginBody 登录信息
     * @return 结果
     */
    public AndroidToken login(AndroidLoginBody androidLoginBody);
}
