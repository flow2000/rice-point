package com.ruoyi.web.controller.miniprogram;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.dish.domain.Dish;
import com.ruoyi.miniprogram.service.IWxDishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜品Controller
 *
 * @author panghai
 * @date 2023-02-18
 */
@RestController
@RequestMapping("/miniprogram/dish")
@Api(value = "WxDishController", tags = "菜品信息接口")
public class WxDishController extends BaseController {
    @Autowired
    private IWxDishService wxDishService;

    /**
     * 查询菜品列表
     */
    @GetMapping("/list")
    @ApiOperation("查询菜品列表")
    public TableDataInfo list(Dish dish) {
        startPage();
        List<Dish> list = wxDishService.selectDishList(dish);
        return getDataTable(list);
    }

    /**
     * 获取菜品详细信息
     */
    @GetMapping(value = "/{dishId}")
    @ApiOperation("获取菜品详细信息")
    public AjaxResult getInfo(@PathVariable("dishId") Long dishId) {
        return AjaxResult.success(wxDishService.selectDishByDishId(dishId));
    }

}
