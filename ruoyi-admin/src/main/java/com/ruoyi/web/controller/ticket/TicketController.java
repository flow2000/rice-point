package com.ruoyi.web.controller.ticket;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.ticket.domain.Ticket;
import com.ruoyi.ticket.service.ITicketService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 投票信息Controller
 *
 * @author panghai
 * @date 2021-10-23
 */
@RestController
@RequestMapping("/ticket/info")
public class TicketController extends BaseController
{
    @Autowired
    private ITicketService ticketService;

    @Autowired
    private ISysUserService userService;

    /** 每日投票限制 */
    private static final int votes = 5;

    /**
     * 查询投票信息列表
     */
    @PreAuthorize("@ss.hasPermi('ticket:info:list')")
    @GetMapping("/list")
    public AjaxResult list(Ticket ticket)
    {
        return AjaxResult.success(ticketService.selectTicketList(ticket));
    }

    /**
     * 导出投票信息列表
     */
    @PreAuthorize("@ss.hasPermi('ticket:info:export')")
    @Log(title = "投票信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Ticket ticket)
    {
        List<Ticket> list = ticketService.selectTicketList(ticket);
        ExcelUtil<Ticket> util = new ExcelUtil<Ticket>(Ticket.class);
        return util.exportExcel(list, "投票信息数据");
    }

    /**
     * 获取投票信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ticket:info:query')")
    @GetMapping(value = "/{ticketId}")
    public AjaxResult getInfo(@PathVariable("ticketId") Long ticketId)
    {
        return AjaxResult.success(ticketService.selectTicketByTicketId(ticketId));
    }

    /**
     * 新增投票信息
     */
    @PreAuthorize("@ss.hasPermi('ticket:info:add')")
    @Log(title = "投票信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Ticket ticket)
    {
        if (ticket.getTime()==null || ticket.getTime() == 0 || ticket.getTime()<=0){
            return AjaxResult.error("期数不合法");
        }
        return toAjax(ticketService.insertTicket(ticket));
    }

    /**
     * 修改投票信息
     */
    @PreAuthorize("@ss.hasPermi('ticket:info:edit')")
    @Log(title = "投票信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Ticket ticket)
    {
        String userName = ticket.getUserName();
        if (userName == null || "".equals(userName)){
            return AjaxResult.error("用户名为空");
        }
        if (ticket.getTicketId() == null || ticket.getTicketId() == 0L ){
            return AjaxResult.error("投票菜品不明确");
        }
        int time = ticketService.getTotalTime();
        Ticket t = ticketService.selectTicketByTicketId(ticket.getTicketId());
        if (t.getTime() != time){
            return AjaxResult.error("请进行最新一期的投票");
        }
        SysUser user = userService.selectUserByUserName(userName);
        if (user == null){
            return AjaxResult.error("请重新登录");
        }
        if (user.getVotes() >= votes){
            return AjaxResult.error("超过每日投票限制");
        }
        user.setVotes(user.getVotes() + 1);
        ticketService.updateUserVotes(user);
        return toAjax(ticketService.updateTicket(ticket));
    }

    /**
     * 删除投票信息
     */
    @PreAuthorize("@ss.hasPermi('ticket:info:remove')")
    @Log(title = "投票信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ticketIds}")
    public AjaxResult remove(@PathVariable Long[] ticketIds)
    {
        return toAjax(ticketService.deleteTicketByTicketIds(ticketIds));
    }

    /**
     * 查询共有几期投票信息
     */
    @Log(title = "投票信息", businessType = BusinessType.DELETE)
    @GetMapping("/getTotalTime")
    public AjaxResult getTotalTime()
    {
        return AjaxResult.success(ticketService.getTotalTime());
    }

    /**
     * 查询某种菜品近7期的投票信息
     */
    @Log(title = "投票信息", businessType = BusinessType.DELETE)
    @GetMapping("/getDishTicket")
    public AjaxResult getDishTicket(Ticket ticket)
    {
        return AjaxResult.success(ticketService.getDishTicket(ticket));
    }
}
