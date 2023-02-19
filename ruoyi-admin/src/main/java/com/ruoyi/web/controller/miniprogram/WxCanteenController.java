package com.ruoyi.web.controller.miniprogram;

import com.ruoyi.canteen.domain.Canteen;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.miniprogram.service.IWxCanteenService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 食堂信息Controller
 *
 * @author panghai
 * @date 2023-02-18
 */
@RestController
@RequestMapping("/miniprogram/canteen")
@Api(value = "WxCanteenController", tags = "食堂信息接口")
public class WxCanteenController extends BaseController {
    @Autowired
    private IWxCanteenService canteenService;

    /**
     * 查询食堂信息列表
     */
    @GetMapping("/list")
    @ApiOperation("查询食堂信息列表")
    public TableDataInfo list(Canteen canteen) {
        startPage();
        List<Canteen> list = canteenService.selectCanteenList(canteen);
        return getDataTable(list);
    }

    /**
     * 获取食堂信息详细信息
     */
    @GetMapping(value = "/{canteenId}")
    @ApiOperation("获取食堂信息详细信息")
    public AjaxResult getInfo(@PathVariable("canteenId") Long canteenId) {
        return AjaxResult.success(canteenService.selectCanteenByCanteenId(canteenId));
    }

}
