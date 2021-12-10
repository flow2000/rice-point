package com.ruoyi.web.controller.board;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.order.service.IOrderService;
import com.ruoyi.system.service.ISysLogininforService;
import com.ruoyi.ticket.service.ITicketService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 面板信息Controller
 *
 * @author panghai
 * @date 2021-10-18
 */
@RestController
@RequestMapping("/board/info")
@Api(value = "BoardController", tags = "面板信息接口")
public class BoardController extends BaseController {

    @Autowired
    private ISysLogininforService logininforService;

    @Autowired
    private ITicketService ticketService;

    @Autowired
    private IOrderService orderService;

    /**
     * 查询面板组
     *
     * @return 统计信息
     */
    @GetMapping("/initBoard")
    @PreAuthorize("@ss.hasPermi('board:info:initBoard')")
    public AjaxResult initBoard() {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("visitsNumber", logininforService.selectLogininforAmount());
        ajax.put("ticketsNumber", ticketService.selectTicketAmount());
        ajax.put("orderAmount", orderService.selectOrderAmount());
        ajax.put("orderMoneyAmount", orderService.selectOrderMoneyAmount());
        return ajax;
    }

    /**
     * 查询折线图信息
     *
     * @return 折线图信息
     */
    @GetMapping("/initLine")
    @PreAuthorize("@ss.hasPermi('board:info:initLine')")
    public AjaxResult initLine() {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("visitisInWeek", logininforService.selectWeekLogininforMap());
        ajax.put("ticketInWeek", ticketService.selectWeekTicketMap());
        ajax.put("orderAmountInWeek", orderService.selectOrderWeekMap());
        ajax.put("orderMoneyAmountInWeek", orderService.selectWeekOrderMoneyMap());
        return ajax;
    }

    /**
     * 查询饼状图信息
     *
     * @return 饼状图信息
     */
    @GetMapping("/initBar")
    @PreAuthorize("@ss.hasPermi('board:info:initBar')")
    public AjaxResult initBar() {
        return AjaxResult.success(orderService.selectCanteenTurnoverMap());
    }
}
