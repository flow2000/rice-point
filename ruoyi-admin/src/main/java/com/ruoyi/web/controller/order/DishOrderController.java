package com.ruoyi.web.controller.order;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.order.domain.DishOrder;
import com.ruoyi.order.service.IDishOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜品订单Controller
 *
 * @author panghai
 * @date 2021-11-09
 */
@RestController
@RequestMapping("/order/dish")
public class DishOrderController extends BaseController
{
    @Autowired
    private IDishOrderService dishOrderService;

    /**
     * 查询菜品订单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(DishOrder dishOrder)
    {
        startPage();
        List<DishOrder> list = dishOrderService.selectDishOrderList(dishOrder);
        return getDataTable(list);
    }

    /**
     * 获取菜品订单详细信息
     */
    @GetMapping(value = "/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId)
    {
        return AjaxResult.success(dishOrderService.selectDishOrderByOrderId(orderId));
    }

    /**
     * 新增菜品订单
     */
    @Log(title = "菜品订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DishOrder dishOrder)
    {
        return toAjax(dishOrderService.insertDishOrder(dishOrder));
    }

    /**
     * 修改菜品订单
     */
    @Log(title = "菜品订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DishOrder dishOrder)
    {
        return toAjax(dishOrderService.updateDishOrder(dishOrder));
    }

    /**
     * 删除菜品订单
     */
    @Log(title = "菜品订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{orderIds}")
    public AjaxResult remove(@PathVariable Long[] orderIds)
    {
        return toAjax(dishOrderService.deleteDishOrderByOrderIds(orderIds));
    }
}
