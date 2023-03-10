package com.ruoyi.web.controller.miniprogram;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.dish.domain.Dish;
import com.ruoyi.miniprogram.domain.WxTicket;
import com.ruoyi.miniprogram.service.IWxTicketService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 投票信息Controller
 *
 * @author panghai
 * @date 2021-10-23
 */
@RestController
@RequestMapping("/miniprogram/ticket")
public class WxTicketController extends BaseController {

    @Autowired
    private IWxTicketService wxTicketService;

    /**
     * 查询菜品投票列表
     */
    @GetMapping("/list")
    @ApiOperation("查询菜品投票列表")
    public TableDataInfo list(Dish dish) {
        List<Dish> list = wxTicketService.selectDishTicketList(dish);
        return getDataTable(list);
    }

    /**
     * 新增投票信息
     */
    @Log(title = "投票信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxTicket wxTicket) {
        if (wxTicket.getOpenId() == null) {
            return AjaxResult.error("无投票者id");
        }
        return wxTicketService.updateWxTicket(wxTicket);
    }

}
