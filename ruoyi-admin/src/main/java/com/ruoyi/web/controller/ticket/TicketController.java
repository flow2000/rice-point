package com.ruoyi.web.controller.ticket;

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
import com.ruoyi.ticket.domain.Ticket;
import com.ruoyi.ticket.service.ITicketService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

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

    /**
     * 查询投票信息列表
     */
    @PreAuthorize("@ss.hasPermi('ticket:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(Ticket ticket)
    {
        startPage();
        List<Ticket> list = ticketService.selectTicketList(ticket);
        return getDataTable(list);
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
}