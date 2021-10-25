package com.ruoyi.web.controller.canteen;

import java.util.List;

import com.ruoyi.canteen.constant.CanteenConstants;
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
import com.ruoyi.canteen.domain.Canteen;
import com.ruoyi.canteen.service.ICanteenService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 食堂信息Controller
 *
 * @author panghai
 * @date 2021-10-06
 */
@RestController
@RequestMapping("/canteen/info")
@Api(value = "CanteenController", tags = "食堂信息接口")
public class CanteenController extends BaseController {
    @Autowired
    private ICanteenService canteenService;

    /**
     * 查询食堂信息列表
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:list')")
    @GetMapping("/list")
    @ApiOperation("查询食堂信息列表")
    public TableDataInfo list(Canteen canteen) {
        startPage();
        List<Canteen> list = canteenService.selectCanteenList(canteen);
        return getDataTable(list);
    }

    /**
     * 导出食堂信息列表
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:export')")
    @Log(title = "食堂信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    @ApiOperation("导出食堂信息列表")
    public AjaxResult export(Canteen canteen) {
        List<Canteen> list = canteenService.selectCanteenList(canteen);
        ExcelUtil<Canteen> util = new ExcelUtil<Canteen>(Canteen.class);
        return util.exportExcel(list, "食堂信息数据");
    }

    /**
     * 获取食堂信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:query')")
    @GetMapping(value = "/{canteenId}")
    @ApiOperation("获取食堂信息详细信息")
    public AjaxResult getInfo(@PathVariable("canteenId") Long canteenId) {
        return AjaxResult.success(canteenService.selectCanteenByCanteenId(canteenId));
    }

    /**
     * 新增食堂信息
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:add')")
    @Log(title = "食堂信息", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增食堂信息")
    public AjaxResult add(@RequestBody Canteen canteen) {
        if (CanteenConstants.NOT_PASS_RULES.equals(canteenService.checkPassRules(canteen)))
        {
            return AjaxResult.error("新增" + canteen.getCanteenName() + "失败,请检查是否符合添加规则");
        }
        if (CanteenConstants.NOT_UNIQUE.equals(canteenService.checkCanteenNameUnique(canteen.getCanteenName())))
        {
            return AjaxResult.error("新增" + canteen.getCanteenName() + "失败,食堂名称已存在");
        }
        return toAjax(canteenService.insertCanteen(canteen));
    }

    /**
     * 修改食堂信息
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:edit')")
    @Log(title = "食堂信息", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改食堂信息")
    public AjaxResult edit(@RequestBody Canteen canteen) {
        if (CanteenConstants.NOT_PASS_RULES.equals(canteenService.checkPassRules(canteen)))
        {
            return AjaxResult.error("修改" + canteen.getCanteenName() + "失败,请检查是否符合规则");
        }
        if (CanteenConstants.NOT_UNIQUE.equals(canteenService.checkCanteenNameUnique(canteen.getCanteenName())))
        {
            return AjaxResult.error("新增" + canteen.getCanteenName() + "失败,食堂名称已存在");
        }
        return toAjax(canteenService.updateCanteen(canteen));
    }

    /**
     * 删除食堂信息
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:remove')")
    @Log(title = "食堂信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{canteenIds}")
    @ApiOperation("删除食堂信息")
    public AjaxResult remove(@PathVariable Long[] canteenIds) {
        if (CanteenConstants.EXIST.equals(canteenService.checkCanteenDishTypeByCanteenIds(canteenIds)))
        {
            return AjaxResult.error("食堂已分配,不能删除");
        }
        return toAjax(canteenService.deleteCanteenByCanteenIds(canteenIds));
    }

    /**
     * 修改食堂状态
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:edit')")
    @Log(title = "食堂信息", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    @ApiOperation("修改食堂状态")
    public AjaxResult changeStatus(@RequestBody Canteen canteen) {
        return toAjax(canteenService.changeCanteenStatus(canteen));
    }

}
