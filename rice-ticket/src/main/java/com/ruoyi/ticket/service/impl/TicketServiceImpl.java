package com.ruoyi.ticket.service.impl;

import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.dish.domain.Dish;
import com.ruoyi.dish.mapper.DishMapper;
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

    @Autowired
    private DishMapper dishMapper;

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

    /**
     * 重置用户投票数
     * 每日重置一次
     */
    @Override
    public void resetUserVotes() {
       ticketMapper.resetUserVotes();
    }

    /**
     * 进入下一期菜品投票
     * 每个月为一期
     */
    @Override
    public void resetDishVotes() {
        int time = ticketMapper.getTotalTime();
        time++;
        List<Dish> list = dishMapper.selectDishList(new Dish());
        List<Long> ids = list.stream().map(Dish::getDishId).collect(Collectors.toList());
        List<Ticket> ticketList = new ArrayList<>();
        for (Long id : ids) {
            Ticket ticket = new Ticket();
            ticket.setTicketNumber(0);
            ticket.setTime(time);
            ticket.setDishId(id);
            ticket.setCreateTime(DateUtils.getNowDate());
            ticketList.add(ticket);
        }
        ticketMapper.insertTickets(ticketList);
    }

    /**
     * 更新用户投票数
     *
     */
    @Override
    public int updateUserVotes(SysUser user) {
        return ticketMapper.updateUserVotes(user);
    }

    /**
     * 查询用户投票数
     * @return 结果
     */
    @Override
    public int selectTicketAmount() {
        return ticketMapper.selectTicketAmount();
    }

    /**
     * 查询每周投票数
     * @return 结果
     */
    @Override
    public Map<String, Object> selectWeekTicketMap() {
        Ticket ticket = new Ticket();
        int time = ticketMapper.getTotalTime();
        if (time == 0){
            time++;
        }
        if (ticket.getTime() == null){
            ticket.setTime(time);
        }
        List<Ticket> list = ticketMapper.selectTicketList(ticket);
        Map<String, Object> res = new HashMap<>();
        String[] t = new String[list.size()];
        int[] a = new int[list.size()];
        for (int i = 0; i < list.size(); i++) {
            Ticket ti = list.get(i);
            t[i] = ti.getDishesName();
            a[i] = ti.getTicketNumber();
        }
        res.put("legend", "票数");
        res.put("type", "bar");
        res.put("xdata", t);
        res.put("ydata", a);
        return res;
    }
}
