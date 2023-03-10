package com.ruoyi.miniprogram.service.impl;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.dish.domain.Dish;
import com.ruoyi.miniprogram.domain.WxTicket;
import com.ruoyi.miniprogram.domain.WxUser;
import com.ruoyi.miniprogram.mapper.WxTicketMapper;
import com.ruoyi.miniprogram.mapper.WxUserMapper;
import com.ruoyi.miniprogram.service.IWxTicketService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/03/10
 * @Description: 小程序投票实现类
 */
@Service
public class WxTicketServiceImpl implements IWxTicketService {

    @Resource
    private WxTicketMapper wxTicketMapper;

    @Resource
    private WxUserMapper wxUserMapper;

    @Override
    public List<Dish> selectDishTicketList(Dish dish) {
        int time = wxTicketMapper.getTotalTime();
        dish.setTime(time);
        return wxTicketMapper.selectDishTicketList(dish);
    }

    @Override
    public AjaxResult updateWxTicket(WxTicket wxTicket) {
        WxUser user = wxUserMapper.selectWxUserByOpenId(wxTicket.getOpenId());
        WxTicket t = wxTicketMapper.selectWxDishTicketByTicketId(wxTicket.getTicketId());
        int time = wxTicketMapper.getTotalTime();
        if (user == null || t == null) {
            return AjaxResult.error("投票者不存在或者投票id不存在");
        }
        if (user.getVotes() >= 5) {
            return AjaxResult.error("超过每天投票数");
        }
        if (t.getTime() != time) {
            return AjaxResult.error("投票期数与最新期数不符");
        }
        t.setTicketNumber(t.getTicketNumber() + 1);
        t.setTime(time);
        user.setVotes(user.getVotes() + 1);
        wxUserMapper.updateWxUser(user);
        if (wxTicketMapper.updateWxTicket(t) == 0) {
            return AjaxResult.error("投票失败");
        }
        return AjaxResult.success("操作成功");
    }
}
