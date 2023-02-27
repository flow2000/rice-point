package com.ruoyi.web.controller.miniprogram;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.miniprogram.domain.WxHome;
import com.ruoyi.miniprogram.service.IWxHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 轮播图Controller
 *
 * @author panghai
 * @date 2023-02-26
 */
@RestController
@RequestMapping("/")
public class WxHomeController extends BaseController {
    @Autowired
    private IWxHomeService wxHomeService;

    /**
     * 查询轮播图列表
     */
    @GetMapping("/miniprogram/home/list")
    public TableDataInfo list(WxHome wxHome) {
        startPage();
        List<WxHome> list = wxHomeService.selectWxHomeList(wxHome);
        return getDataTable(list);
    }

    /**
     * 导出轮播图列表
     */
    @Log(title = "轮播图", businessType = BusinessType.EXPORT)
    @GetMapping("/home/export")
    public AjaxResult export(WxHome wxHome) {
        List<WxHome> list = wxHomeService.selectWxHomeList(wxHome);
        ExcelUtil<WxHome> util = new ExcelUtil<WxHome>(WxHome.class);
        return util.exportExcel(list, "轮播图数据");
    }

    /**
     * 获取轮播图详细信息
     */
    @GetMapping(value = "/miniprogram/home/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(wxHomeService.selectWxHomeByAppid(id));
    }

    /**
     * 新增轮播图
     */
    @PreAuthorize("@ss.hasPermi('home:add')")
    @Log(title = "轮播图", businessType = BusinessType.INSERT)
    @PostMapping("/home")
    public AjaxResult add(@RequestBody WxHome wxHome) {
        return toAjax(wxHomeService.insertWxHome(wxHome));
    }

    /**
     * 修改轮播图
     */
    @PreAuthorize("@ss.hasPermi('home:edit')")
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PutMapping("/home")
    public AjaxResult edit(@RequestBody WxHome wxHome) {
        return toAjax(wxHomeService.updateWxHome(wxHome));
    }

    /**
     * 删除轮播图
     */
    @PreAuthorize("@ss.hasPermi('home:remove')")
    @Log(title = "轮播图", businessType = BusinessType.DELETE)
    @DeleteMapping("/home/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(wxHomeService.deleteWxHomeByIds(ids));
    }
}
