package com.ruoyi.web.controller.android.order;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.order.domain.Order;
import com.ruoyi.order.service.IOrderService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户订单Controller
 *
 * @author panghai
 * @date 2021-12-09
 */
@RestController
@RequestMapping("/order/order")
public class AndroidOrderController extends BaseController {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private TokenService tokenService;

    /**
     * 获取用户订单
     */
    @PreAuthorize("@ss.hasPermi('order:order:query')")
    @GetMapping("/listUserOrder")
    public AjaxResult listUserOrder(Order order) {
        // 根据请求获取登录用户信息
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        String userName = loginUser.getUsername();
        if (userName == null || "".equals(userName)) {
            return AjaxResult.error("用户名为空");
        }
        // 查询用户
        SysUser user = userService.selectUserByUserName(userName);
        // 用户不存在
        if (user == null) {
            return AjaxResult.error("请重新登录");
        }
        order.setUserId(user.getUserId());
        return AjaxResult.success(orderService.listUserOrder(order));
    }
}
