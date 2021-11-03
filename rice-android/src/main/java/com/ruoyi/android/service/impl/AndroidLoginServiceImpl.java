package com.ruoyi.android.service.impl;

import com.ruoyi.android.domain.AndroidLoginBody;
import com.ruoyi.android.domain.AndroidToken;
import com.ruoyi.android.domain.AndroidUser;
import com.ruoyi.android.mapper.AndroidLoginMapper;
import com.ruoyi.android.service.AndroidTokenService;
import com.ruoyi.android.service.IAndroidLoginService;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 安卓登录Service业务层处理
 *
 * @author panghai
 * @date 2021-10-31
 */
@Service
public class AndroidLoginServiceImpl implements IAndroidLoginService {

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

        //数据库查询得到的密码
        String password = androidUser.getPassword();

        //登录密码
        String pd = androidLoginBody.getPassword();

        //密码错误
        if (!password.equals(pd)){
            return null;
        }

        //生成访问令牌并保存redis
        AndroidToken androidToken = androidTokenService.createToken(androidUser);

        //生成刷新令牌
        String refreshToken = androidTokenService.createRefreshToken();
        androidToken.setUserId(androidUser.getUserId());
        androidToken.setRefreshToken(refreshToken);
        androidToken.setRefreshTokenExpiresIn(androidTokenService.getRefreshTokenExpiresIn());
        androidToken.setCreateTime(DateUtils.getNowDate());

        //删除原有刷新token
        androidLoginMapper.deleteRefreshToken(androidToken);
        //保存数据库
        androidLoginMapper.insertRefreshToken(androidToken);

        //返回token对象
        return androidToken;
    }

}
