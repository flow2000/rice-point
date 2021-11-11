package com.ruoyi.ticket.service.impl;

import java.util.Collections;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ticket.mapper.TicketMapper;
import com.ruoyi.ticket.domain.Ticket;
import com.ruoyi.ticket.service.ITicketService;

/**
 * 投票信息Service业务层处理
 *
 * @author panghai
 * @date 2021-10-23
 */
@Service
public class TicketServiceImpl implements ITicketService
{
    @Autowired
    private TicketMapper ticketMapper;

    /**
     * 查询投票信息
     *
     * @param ticketId 投票信息主键
     * @return 投票信息
     */
    @Override
    public Ticket selectTicketByTicketId(Long ticketId)
    {
        return ticketMapper.selectTicketByTicketId(ticketId);
    }

    /**
     * 查询投票信息列表
     *
     * @param ticket 投票信息
     * @return 投票信息
     */
    @Override
    public List<Ticket> selectTicketList(Ticket ticket)
    {
        int time = ticketMapper.getTotalTime();
        if (time == 0){
            time++;
        }
        if (ticket.getTime() == null){
            ticket.setTime(time);
        }
        return ticketMapper.selectTicketList(ticket);
    }

    /**
     * 新增投票信息
     *
     * @param ticket 投票信息
     * @return 结果
     */
    @Override
    public int insertTicket(Ticket ticket)
    {
        ticket.setCreateTime(DateUtils.getNowDate());
        return ticketMapper.insertTicket(ticket);
    }

    /**
     * 修改投票信息
     *
     * @param ticket 投票信息
     * @return 结果
     */
    @Override
    public int updateTicket(Ticket ticket)
    {
        return ticketMapper.updateTicket(ticket);
    }

    /**
     * 批量删除投票信息
     *
     * @param ticketIds 需要删除的投票信息主键
     * @return 结果
     */
    @Override
    public int deleteTicketByTicketIds(Long[] ticketIds)
    {
        return ticketMapper.deleteTicketByTicketIds(ticketIds);
    }

    /**
     * 删除投票信息信息
     *
     * @param ticketId 投票信息主键
     * @return 结果
     */
    @Override
    public int deleteTicketByTicketId(Long ticketId)
    {
        return ticketMapper.deleteTicketByTicketId(ticketId);
    }

    /**
     * 查询共有几期投票信息
     *
     * @return 结果
     */
    @Override
    public int getTotalTime() {
        return ticketMapper.getTotalTime();
    }

    /**
     * 查询某种菜品近7期的投票信息
     *
     * @return 结果
     */
    @Override
    public List<Ticket> getDishTicket(Ticket ticket) {
        List<Ticket> list = ticketMapper.getDishTicket(ticket);
        Collections.reverse(list);
        return list;
    }
}
