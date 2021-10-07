package com.ruoyi.web.controller.canteen;

import java.util.List;
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
public class CanteenController extends BaseController
{
    @Autowired
    private ICanteenService canteenService;

    /**
     * 查询食堂信息列表
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(Canteen canteen)
    {
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
    public AjaxResult export(Canteen canteen)
    {
        List<Canteen> list = canteenService.selectCanteenList(canteen);
        ExcelUtil<Canteen> util = new ExcelUtil<Canteen>(Canteen.class);
        return util.exportExcel(list, "食堂信息数据");
    }

    /**
     * 获取食堂信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:query')")
    @GetMapping(value = "/{canteenId}")
    public AjaxResult getInfo(@PathVariable("canteenId") Long canteenId)
    {
        return AjaxResult.success(canteenService.selectCanteenByCanteenId(canteenId));
    }

    /**
     * 新增食堂信息
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:add')")
    @Log(title = "食堂信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Canteen canteen)
    {
        return toAjax(canteenService.insertCanteen(canteen));
    }

    /**
     * 修改食堂信息
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:edit')")
    @Log(title = "食堂信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Canteen canteen)
    {
        return toAjax(canteenService.updateCanteen(canteen));
    }

    /**
     * 删除食堂信息
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:remove')")
    @Log(title = "食堂信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{canteenIds}")
    public AjaxResult remove(@PathVariable Long[] canteenIds)
    {
        return toAjax(canteenService.deleteCanteenByCanteenIds(canteenIds));
    }

    /**
     * 修改食堂状态
     */
    @PreAuthorize("@ss.hasPermi('canteen:info:edit')")
    @Log(title = "食堂信息", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody Canteen canteen)
    {
        return toAjax(canteenService.changeCanteenStatus(canteen));
    }

}
