package com.ruoyi.web.controller.miniprogram;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.miniprogram.domain.WxConfig;
import com.ruoyi.miniprogram.service.IWxConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 微信小程序配置Controller
 *
 * @author panghai
 * @date 2023-02-08
 */
@RestController
@RequestMapping("/miniprogram/config")
public class WxConfigController extends BaseController {
    @Autowired
    private IWxConfigService WxConfigService;

    /**
     * 查询微信小程序配置列表
     */
    @PreAuthorize("@ss.hasPermi('miniprogram:config:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxConfig wxConfig) {
        startPage();
        List<WxConfig> list = WxConfigService.selectWxConfigList(wxConfig);
        return getDataTable(list);
    }

    /**
     * 导出微信小程序配置列表
     */
    @PreAuthorize("@ss.hasPermi('miniprogram:config:export')")
    @Log(title = "微信小程序配置", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(WxConfig wxConfig) {
        List<WxConfig> list = WxConfigService.selectWxConfigList(wxConfig);
        ExcelUtil<WxConfig> util = new ExcelUtil<WxConfig>(WxConfig.class);
        return util.exportExcel(list, "微信小程序配置数据");
    }

    /**
     * 获取微信小程序配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('miniprogram:config:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(WxConfigService.selectWxConfigById(id));
    }

    /**
     * 新增微信小程序配置
     */
    @PreAuthorize("@ss.hasPermi('miniprogram:config:add')")
    @Log(title = "微信小程序配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxConfig wxConfig) {
        return toAjax(WxConfigService.insertWxConfig(wxConfig));
    }

    /**
     * 修改微信小程序配置
     */
    @PreAuthorize("@ss.hasPermi('miniprogram:config:edit')")
    @Log(title = "微信小程序配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxConfig wxConfig) {
        return toAjax(WxConfigService.updateWxConfig(wxConfig));
    }

    /**
     * 删除微信小程序配置
     */
    @PreAuthorize("@ss.hasPermi('miniprogram:config:remove')")
    @Log(title = "微信小程序配置", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(WxConfigService.deleteWxConfigByIds(ids));
    }
}
