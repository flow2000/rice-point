package com.ruoyi.android.service.impl;

import com.ruoyi.android.domain.AndroidLoginBody;
import com.ruoyi.android.domain.AndroidToken;
import com.ruoyi.android.domain.AndroidUser;
import com.ruoyi.android.mapper.AndroidLoginMapper;
import com.ruoyi.android.service.AndroidTokenService;
import com.ruoyi.android.service.IAndroidLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 安卓登录Service业务层处理
 *
 * @author panghai
 * @date 2021-10-31
 */
@Service
public class AndroidAndroidLoginServiceImpl implements IAndroidLoginService {

    @Autowired
    private AndroidTokenService androidTokenService;

    @Autowired
    private AndroidLoginMapper androidLoginMapper;

    /**
     * android登录
     *
     * @param androidLoginBody 登录信息
     * @return 结果
     */
    @Override
    public AndroidToken login(AndroidLoginBody androidLoginBody) {

        //数据库查找用户,返回androidUser用户对象
        AndroidUser androidUser = androidLoginMapper.androidLogin(androidLoginBody);

        //用户不存在
        if (androidUser == null){
            return null;
        }

        //解密password
        String password = androidUser.getPassword();

        //密码错误
        if (password.equals(androidLoginBody.getPassword())){
            return null;
        }

        //生成token对象并返回
        return androidTokenService.createToken(androidUser);
    }

}
