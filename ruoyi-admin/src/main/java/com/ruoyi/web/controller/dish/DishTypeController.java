package com.ruoyi.web.controller.dish;

import java.util.List;

import com.ruoyi.dish.constatnt.DishTypeConstants;
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
import com.ruoyi.dish.domain.DishType;
import com.ruoyi.dish.service.IDishTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 菜品类型Controller
 *
 * @author panghai
 * @date 2021-10-19
 */
@RestController
@RequestMapping("/dish/type")
@Api(value="DishTypeController",tags="菜品类型接口")
public class DishTypeController extends BaseController
{
    @Autowired
    private IDishTypeService dishTypeService;

    /**
     * 查询菜品类型列表
     */
    @PreAuthorize("@ss.hasPermi('dish:type:list')")
    @GetMapping("/list")
    @ApiOperation("查询菜品类型列表")
    public TableDataInfo list(DishType dishType)
    {
        startPage();
        List<DishType> list = dishTypeService.selectDishTypeList(dishType);
        return getDataTable(list);
    }

    /**
     * 导出菜品类型列表
     */
    @PreAuthorize("@ss.hasPermi('dish:type:export')")
    @Log(title = "菜品类型", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    @ApiOperation("导出菜品类型列表")
    public AjaxResult export(DishType dishType)
    {
        List<DishType> list = dishTypeService.selectDishTypeList(dishType);
        ExcelUtil<DishType> util = new ExcelUtil<DishType>(DishType.class);
        return util.exportExcel(list, "菜品类型数据");
    }

    /**
     * 获取菜品类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('dish:type:query')")
    @GetMapping(value = "/{typeId}")
    @ApiOperation("获取菜品类型详细信息")
    public AjaxResult getInfo(@PathVariable("typeId") Long typeId)
    {
        return AjaxResult.success(dishTypeService.selectDishTypeByTypeId(typeId));
    }

    /**
     * 新增菜品类型
     */
    @PreAuthorize("@ss.hasPermi('dish:type:add')")
    @Log(title = "菜品类型", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增菜品类型")
    public AjaxResult add(@RequestBody DishType dishType)
    {
        if (DishTypeConstants.NOT_UNIQUE.equals(dishTypeService.checkDishTypeNameUnique(dishType.getTypeName())))
        {
            return AjaxResult.error("新增菜品类型" + dishType.getTypeName() + "失败,菜品类型名称已存在");
        }
        return toAjax(dishTypeService.insertDishType(dishType));
    }

    /**
     * 修改菜品类型
     */
    @PreAuthorize("@ss.hasPermi('dish:type:edit')")
    @Log(title = "菜品类型", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改菜品类型")
    public AjaxResult edit(@RequestBody DishType dishType)
    {
        return toAjax(dishTypeService.updateDishType(dishType));
    }

    /**
     * 删除菜品类型
     */
    @PreAuthorize("@ss.hasPermi('dish:type:remove')")
    @Log(title = "菜品类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{typeIds}")
    @ApiOperation("删除菜品类型")
    public AjaxResult remove(@PathVariable Long[] typeIds)
    {
        return toAjax(dishTypeService.deleteDishTypeByTypeIds(typeIds));
    }

    /**
     * 修改菜品类型状态
     */
    @PreAuthorize("@ss.hasPermi('dish:type:edit')")
    @Log(title = "菜品类型", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    @ApiOperation("修改菜品类型状态")
    public AjaxResult changeStatus(@RequestBody DishType dishType)
    {
        return toAjax(dishTypeService.changeTypeStatus(dishType));
    }
}
