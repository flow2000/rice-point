package com.ruoyi.web.controller.dish;

import java.util.List;

import com.ruoyi.dish.constatnt.DishConstants;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.dish.domain.Dish;
import com.ruoyi.dish.service.IDishService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 菜品Controller
 *
 * @author panghai
 * @date 2021-10-23
 */
@RestController
@RequestMapping("/dish/dish")
@Api(value="DishController",tags="菜品信息接口")
public class DishController extends BaseController
{
    @Autowired
    private IDishService dishService;

    /**
     * 查询菜品列表
     */
    @PreAuthorize("@ss.hasPermi('dish:dish:list')")
    @GetMapping("/list")
    @ApiOperation("查询菜品列表")
    public TableDataInfo list(Dish dish)
    {
        startPage();
        List<Dish> list = dishService.selectDishList(dish);
        return getDataTable(list);
    }

    /**
     * 导出菜品列表
     */
    @PreAuthorize("@ss.hasPermi('dish:dish:export')")
    @Log(title = "菜品信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    @ApiOperation("导出菜品列表")
    public AjaxResult export(Dish dish)
    {
        List<Dish> list = dishService.selectDishList(dish);
        ExcelUtil<Dish> util = new ExcelUtil<Dish>(Dish.class);
        return util.exportExcel(list, "菜品数据");
    }

    /**
     * 获取菜品详细信息
     */
    @PreAuthorize("@ss.hasPermi('dish:dish:query')")
    @GetMapping(value = "/{dishId}")
    @ApiOperation("获取菜品详细信息")
    public AjaxResult getInfo(@PathVariable("dishId") Long dishId)
    {
        return AjaxResult.success(dishService.selectDishByDishId(dishId));
    }

    /**
     * 新增菜品
     */
    @PreAuthorize("@ss.hasPermi('dish:dish:add')")
    @Log(title = "菜品信息", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增菜品")
    public AjaxResult add(@RequestBody Dish dish)
    {
        if (DishConstants.UNIQUE.equals(dishService.checkDishesNameUnique(dish)))
        {
            return AjaxResult.error("新增菜品" + dish.getDishesName() + "失败,菜品名称已存在");
        }
        return toAjax(dishService.insertDish(dish));
    }

    /**
     * 修改菜品
     */
    @PreAuthorize("@ss.hasPermi('dish:dish:edit')")
    @Log(title = "菜品信息", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改菜品")
    public AjaxResult edit(@RequestBody Dish dish)
    {
        if (DishConstants.UNIQUE.equals(dishService.checkDishesNameUnique(dish)))
        {
            return AjaxResult.error("修改菜品" + dish.getDishesName() + "失败,菜品名称已存在");
        }
        return toAjax(dishService.updateDish(dish));
    }

    /**
     * 删除菜品
     */
    @PreAuthorize("@ss.hasPermi('dish:dish:remove')")
    @Log(title = "菜品信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dishIds}")
    @ApiOperation("删除菜品")
    public AjaxResult remove(@PathVariable Long[] dishIds)
    {
        return toAjax(dishService.deleteDishByDishIds(dishIds));
    }

    /**
     * 修改菜品状态
     */
    @PreAuthorize("@ss.hasPermi('dish:dish:edit')")
    @Log(title = "菜品信息", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    @ApiOperation("修改菜品状态")
    public AjaxResult changeStatus(@RequestBody Dish dish)
    {
        return toAjax(dishService.changeDishStatus(dish));
    }
}
