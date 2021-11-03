package com.ruoyi.web.controller.android.login;

import com.ruoyi.android.service.IAndroidLoginService;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.android.domain.AndroidLoginBody;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登录验证
 *
 * @author panghai
 */
@RestController
@RequestMapping("/app/user")
@Api(value = "AndroidLoginController", tags = "安卓用户登录接口")
public class AndroidLoginController extends BaseController {

    @Autowired
    private IAndroidLoginService androidLoginService;

    /**
     * android登录
     *
     * @param androidLoginBody 登录信息
     * @return 结果
     */
    @ApiOperation("安卓登录")
    @PostMapping("/login")
    public AjaxResult login(@RequestBody AndroidLoginBody androidLoginBody) {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = androidLoginService.login(androidLoginBody);
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }
}
