package com.ruoyi.ticket.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.common.core.domain.entity.SysUser;
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
     * 进入下一期菜品投票
     * 每个月为一期
     */
    public void resetDishVotes();

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
     * 查询每周投票数
     * @return 结果
     */
    public Map<String, Object> selectWeekTicketMap();

    /**
     * 查询最新一期的投票信息列表
     * @return 结果
     */
    public List<Object> selectTicketsList(Ticket ticket);
}
