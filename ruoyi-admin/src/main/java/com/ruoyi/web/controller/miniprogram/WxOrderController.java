package com.ruoyi.web.controller.miniprogram;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.miniprogram.service.IWxOrderService;
import com.ruoyi.order.domain.DishOrder;
import com.ruoyi.order.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 订单Controller
 *
 * @author panghai
 * @date 2023-02-19
 */
@RestController
@RequestMapping("/miniprogram/order")
public class WxOrderController extends BaseController {
    @Autowired
    private IWxOrderService wxOrderService;

    /**
     * 查询订单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Order order) {
        startPage();
        List<Order> list = wxOrderService.selectWxOrderList(order);
        return getDataTable(list);
    }

    /**
     * 获取订单详细信息
     */
    @GetMapping(value = "/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId) {
        return AjaxResult.success(wxOrderService.selectWxOrderByOrderId(orderId));
    }

    /**
     * 新增订单
     */
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody Order order) {
        if (order.getCanteenId() == null) {
            return AjaxResult.error("系统错误，就餐食堂不能为空");
        }
        if (order.getUserId() == null){
            return AjaxResult.error("系统错误，就餐人id不能为空");
        }
        List<DishOrder> dishOrders = order.getDishOrders();
        if (dishOrders == null || dishOrders.size() == 0) {
            return AjaxResult.error("请先选择菜品");
        }
        return toAjax(wxOrderService.insertWxOrder(order));
    }

    /**
     * 删除订单
     */
    @Log(title = "订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{orderIds}")
    public AjaxResult remove(@PathVariable Long[] orderIds) {
        return toAjax(wxOrderService.deleteWxOrderByOrderIds(orderIds));
    }
}
