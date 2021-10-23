package com.ruoyi.ticket.service;

import java.util.List;
import com.ruoyi.ticket.domain.Ticket;

/**
 * 投票信息Service接口
 * 
 * @author panghai
 * @date 2021-10-23
 */
public interface ITicketService 
{
    /**
     * 查询投票信息
     * 
     * @param ticketId 投票信息主键
     * @return 投票信息
     */
    public Ticket selectTicketByTicketId(Long ticketId);

    /**
     * 查询投票信息列表
     * 
     * @param ticket 投票信息
     * @return 投票信息集合
     */
    public List<Ticket> selectTicketList(Ticket ticket);

    /**
     * 新增投票信息
     * 
     * @param ticket 投票信息
     * @return 结果
     */
    public int insertTicket(Ticket ticket);

    /**
     * 修改投票信息
     * 
     * @param ticket 投票信息
     * @return 结果
     */
    public int updateTicket(Ticket ticket);

    /**
     * 批量删除投票信息
     * 
     * @param ticketIds 需要删除的投票信息主键集合
     * @return 结果
     */
    public int deleteTicketByTicketIds(Long[] ticketIds);

    /**
     * 删除投票信息信息
     * 
     * @param ticketId 投票信息主键
     * @return 结果
     */
    public int deleteTicketByTicketId(Long ticketId);
}
