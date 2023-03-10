package com.ruoyi.miniprogram.service;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.dish.domain.Dish;
import com.ruoyi.miniprogram.domain.WxTicket;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/03/10
 * @Description: 小程序投票接口
 */
public interface IWxTicketService {
    /**
     * 查询菜品投票列表
     */
    public List<Dish> selectDishTicketList(Dish dish);

    /**
     * 新增投票信息
     */
    public AjaxResult updateWxTicket(WxTicket wxTicket);
}
