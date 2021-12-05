package com.ruoyi.web.controller.android.ticket;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.ticket.domain.Ticket;
import com.ruoyi.ticket.service.ITicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    private ISysUserService userService;

    @Autowired
    private TokenService tokenService;

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

    /**
     * 菜品投票
     */
    @PreAuthorize("@ss.hasPermi('ticket:info:edit')")
    @Log(title = "投票信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Ticket ticket)
    {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        String userName = loginUser.getUsername();
        if (userName == null || "".equals(userName)){
            return AjaxResult.error("用户名为空");
        }
        SysUser user = userService.selectUserByUserName(userName);
        if (user == null){
            return AjaxResult.error("请重新登录");
        }
        if (user.getVotes() >= votes){
            return AjaxResult.error("超过每日投票限制");
        }
        if (ticket.getTicketId() == null || ticket.getTicketId() == 0L ){
            return AjaxResult.error("投票菜品不明确");
        }
        int time = ticketService.getTotalTime();
        Ticket t = ticketService.selectTicketByTicketId(ticket.getTicketId());
        if (t.getTime() != time){
            return AjaxResult.error("请进行最新一期的投票");
        }
        user.setVotes(user.getVotes() + 1);
        ticketService.updateUserVotes(user);
        return toAjax(ticketService.updateTicket(ticket));
    }
}
