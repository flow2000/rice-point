package com.ruoyi.miniprogram.mapper;

import com.ruoyi.dish.domain.Dish;
import com.ruoyi.miniprogram.domain.WxTicket;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/03/10
 * @Description: 小程序投票Mapper
 */
public interface WxTicketMapper {


    /**
     * 查询菜品投票列表
     */
    public List<Dish> selectDishTicketList(Dish dish);

    /**
     * 新增投票信息
     */
    public int updateWxTicket(WxTicket wxTicket);

    /**
     * 通过投票id获取投票信息
     */
    public WxTicket selectWxDishTicketByTicketId(Long ticketId);

    /**
     * 查询共有几期投票信息
     *
     */
    public int getTotalTime();
}
