package com.ruoyi.web.controller.miniprogram;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.miniprogram.domain.WxUser;
import com.ruoyi.miniprogram.service.IWxUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 微信用户Controller
 *
 * @author panghai
 * @date 2023-02-08
 */
@RestController
@RequestMapping("/miniprogram/user")
public class WxUserController extends BaseController {

    @Autowired
    private IWxUserService wxUserService;

    /**
     * 微信小程序登录
     *
     * @param appid appid
     * @param code  wx.login()方法得到的code
     * @return 登录结果
     */
    @PostMapping("/login")
    public AjaxResult login(String appid, String code) {
        return wxUserService.login(appid, code);
    }

    /**
     * 查询微信用户列表
     */
    @GetMapping("/list")
    public TableDataInfo list(WxUser wxUser) {
        startPage();
        List<WxUser> list = wxUserService.selectWxUserList(wxUser);
        return getDataTable(list);
    }

    /**
     * 导出微信用户列表
     */
    @PreAuthorize("@ss.hasPermi('miniprogram:user:export')")
    @Log(title = "微信用户", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(WxUser wxUser) {
        List<WxUser> list = wxUserService.selectWxUserList(wxUser);
        ExcelUtil<WxUser> util = new ExcelUtil<WxUser>(WxUser.class);
        return util.exportExcel(list, "微信用户数据");
    }

    /**
     * 获取微信用户详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(wxUserService.selectWxUserById(id));
    }

    /**
     * 新增微信用户
     */
    @PreAuthorize("@ss.hasPermi('miniprogram:user:add')")
    @Log(title = "微信用户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxUser wxUser) {
        return toAjax(wxUserService.insertWxUser(wxUser));
    }

    /**
     * 修改微信用户
     */
    @PutMapping
    public AjaxResult edit(@RequestBody WxUser wxUser) {
        wxUser.setUpdateTime(DateUtils.getNowDate());
        return toAjax(wxUserService.updateWxUser(wxUser));
    }

    /**
     * 删除微信用户
     */
    @PreAuthorize("@ss.hasPermi('miniprogram:user:remove')")
    @Log(title = "微信用户", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(wxUserService.deleteWxUserByIds(ids));
    }
}
