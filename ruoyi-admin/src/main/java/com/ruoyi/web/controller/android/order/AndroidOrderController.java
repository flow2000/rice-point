package com.ruoyi.web.controller.android.order;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.order.domain.DishOrder;
import com.ruoyi.order.domain.Order;
import com.ruoyi.order.service.IOrderService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
        order.setUserId(String.valueOf(user.getUserId()));
        return AjaxResult.success(orderService.listUserOrder(order));
    }

    /**
     * 新增订单
     */
    @PreAuthorize("@ss.hasPermi('order:order:add')")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Order order)
    {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        String userName = loginUser.getUsername();
        if (userName == null || "".equals(userName)){
            return AjaxResult.error("用户名为空");
        }
        SysUser user = userService.selectUserByUserName(userName);
        if (user == null){
            return AjaxResult.error("请重新登录");
        }
        if (order.getCanteenId() == null){
            return AjaxResult.error("系统错误，就餐食堂不能为空");
        }
        // 设置用户id
        order.setUserId(String.valueOf(user.getUserId()));
        List<DishOrder> dishOrders = order.getDishOrders();
        if (dishOrders == null || dishOrders.size() == 0){
            return AjaxResult.error("请先选择菜品");
        }
        return toAjax(orderService.insertOrder(order));
    }


}
