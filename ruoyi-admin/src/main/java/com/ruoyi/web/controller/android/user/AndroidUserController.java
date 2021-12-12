package com.ruoyi.web.controller.android.user;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户信息
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/user/info")
public class AndroidUserController extends BaseController {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private TokenService tokenService;

    /**
     * 获取安卓用户详细信息
     */
    @GetMapping("/getUserInfo")
    public AjaxResult getUserInfo() {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        String userName = loginUser.getUsername();
        if (userName == null || "".equals(userName)){
            return AjaxResult.error("用户名为空");
        }
        return AjaxResult.success(userService.selectUserByUserName(userName));
    }
}
