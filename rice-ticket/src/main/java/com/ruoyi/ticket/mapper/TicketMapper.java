package com.ruoyi.ticket.mapper;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.ticket.domain.Ticket;

/**
 * 投票信息Mapper接口
 *
 * @author panghai
 * @date 2021-10-23
 */
public interface TicketMapper
{
    /**
     * 查询投票信息
     *
     * @param ticketId 投票信息主键
     * @return 投票信息
     */
    public Ticket selectTicketByTicketId(Long ticketId);

    /**
     * 查询票数在前十名的最新一期投票信息列表
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
     * 新增投票信息
     *
     * @param ticketList 投票信息组
     * @return 结果
     */
    public int insertTickets(List<Ticket> ticketList);

    /**
     * 修改投票信息
     *
     * @param ticket 投票信息
     * @return 结果
     */
    public int updateTicket(Ticket ticket);

    /**
     * 删除投票信息
     *
     * @param ticketId 投票信息主键
     * @return 结果
     */
    public int deleteTicketByTicketId(Long ticketId);

    /**
     * 批量删除投票信息
     *
     * @param ticketIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTicketByTicketIds(Long[] ticketIds);

    /**
     * 查询共有几期投票信息
     *
     * @return 结果
     */
    public int getTotalTime();

    /**
     * 查询某种菜品近7期的投票信息
     *
     * @return 结果
     */
    public List<Ticket> getDishTicket(Ticket ticket);

    /**
     * 重置用户投票数
     * 每日重置一次
     */
    public void resetUserVotes();

    /**
     * 重置用户投票数
     * 每日重置一次
     */
    public void resetWxUserVotes();

    /**
     * 更新用户投票数
     *
     */
    public int updateUserVotes(SysUser user);

    /**
     * 查询用户投票数
     * @return 结果
     */
    public int selectTicketAmount();

    /**
     * 查询最新一期的投票信息列表
     * @return 结果
     */
    public List<Ticket> selectTicketsList(Ticket ticket);

}
