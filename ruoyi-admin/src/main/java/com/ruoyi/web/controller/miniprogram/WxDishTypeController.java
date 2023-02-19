package com.ruoyi.web.controller.miniprogram;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.dish.domain.DishType;
import com.ruoyi.miniprogram.service.IWxDishTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜品类型Controller
 *
 * @author panghai
 * @date 2023-02-18
 */
@RestController
@RequestMapping("/miniprogram/type")
@Api(value = "WxDishTypeController", tags = "菜品类型接口")
public class WxDishTypeController extends BaseController {
    @Autowired
    private IWxDishTypeService WxDishTypeService;

    /**
     * 查询菜品类型列表
     */
    @GetMapping("/list")
    @ApiOperation("查询菜品类型列表")
    public TableDataInfo list(DishType dishType) {
        startPage();
        List<DishType> list = WxDishTypeService.selectWxDishTypeList(dishType);
        return getDataTable(list);
    }

    /**
     * 获取菜品类型详细信息
     */
    @GetMapping(value = "/{typeId}")
    @ApiOperation("获取菜品类型详细信息")
    public AjaxResult getInfo(@PathVariable("typeId") Long typeId) {
        return AjaxResult.success(WxDishTypeService.selectWxDishTypeByTypeId(typeId));
    }

}
