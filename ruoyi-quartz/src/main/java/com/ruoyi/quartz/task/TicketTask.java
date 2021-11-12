package com.ruoyi.quartz.task;

import com.ruoyi.ticket.service.ITicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 投票定时器
 *
 * @author ruoyi
 */
@Component("ticketTask")
public class TicketTask {

    @Autowired
    private ITicketService ticketService;

    // 重置用户每日投票限制数
    public void resetUserVotes(){
        ticketService.resetUserVotes();
    }

    // 进入下一期菜品投票
    public void resetDishVotes(){
        ticketService.resetDishVotes();
    }
}
