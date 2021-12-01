package com.ruoyi.web.controller.android.ticket;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.ticket.domain.Ticket;
import com.ruoyi.ticket.service.ITicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 投票信息Controller
 *
 * @author panghai
 * @date 2021-12-1
 */
@RestController
@RequestMapping("/ticket/info")
public class AndroidTicketController extends BaseController {

    @Autowired
    private ITicketService ticketService;

    /** 每日投票限制 */
    private static final int votes = 5;

    /**
     * 查询最新一期的投票信息列表
     */
    @PreAuthorize("@ss.hasPermi('ticket:info:list')")
    @GetMapping("/listTickets")
    public AjaxResult listTickets(Ticket ticket)
    {
        return AjaxResult.success(ticketService.selectTicketsList(ticket));
    }
}
