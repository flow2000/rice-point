package com.ruoyi.web.controller.android.dish;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.dish.domain.Dish;
import com.ruoyi.dish.service.IDishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 投票信息Controller
 *
 * @author panghai
 * @date 2021-12-1
 */
@RestController
@RequestMapping("/dish/dish")
@Api(value="DishController",tags="菜品信息接口")
public class AndroidDishController extends BaseController {

    @Autowired
    private IDishService dishService;

    /**
     * 查询今日上架菜品列表
     */
    @PreAuthorize("@ss.hasPermi('dish:dish:list')")
    @GetMapping("/listTodayDish")
    @ApiOperation("查询今日菜品列表")
    public AjaxResult listTodayDish(Dish dish)
    {
        return AjaxResult.success(dishService.selectTodayDishList(dish));
    }

}
