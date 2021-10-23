package com.ruoyi.ticket.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 投票信息对象 rice_ticket
 * 
 * @author panghai
 * @date 2021-10-23
 */
public class Ticket extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 投票id */
    private Long ticketId;

    /** 菜品id */
    @Excel(name = "菜品id")
    private Long dishId;

    /** 票数 */
    @Excel(name = "票数")
    private Integer ticketNumber;

    /** 第几期 */
    @Excel(name = "第几期")
    private Integer time;

    public void setTicketId(Long ticketId) 
    {
        this.ticketId = ticketId;
    }

    public Long getTicketId() 
    {
        return ticketId;
    }
    public void setDishId(Long dishId) 
    {
        this.dishId = dishId;
    }

    public Long getDishId() 
    {
        return dishId;
    }
    public void setTicketNumber(Integer ticketNumber) 
    {
        this.ticketNumber = ticketNumber;
    }

    public Integer getTicketNumber() 
    {
        return ticketNumber;
    }
    public void setTime(Integer time) 
    {
        this.time = time;
    }

    public Integer getTime() 
    {
        return time;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ticketId", getTicketId())
            .append("dishId", getDishId())
            .append("ticketNumber", getTicketNumber())
            .append("time", getTime())
            .append("createTime", getCreateTime())
            .toString();
    }
}
