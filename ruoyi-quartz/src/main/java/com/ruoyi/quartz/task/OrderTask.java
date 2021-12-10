package com.ruoyi.quartz.task;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.order.domain.Order;
import com.ruoyi.order.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * 订单定时器
 *
 * @author ruoyi
 */
@Component("orderTask")
public class OrderTask {

    @Autowired
    private OrderMapper orderMapper;

    // 超时时间：30分钟
    private final static Long timeout = 60*1000*30L;

    // 重置用户每日投票限制数
    public void resetUserVotes(){
        Order order = new Order();
        // 查询未处理订单
        order.setStatus("0");
        List<Order> list = orderMapper.selectOrderList(order);
        // 判断是否已超时
        for (Order o : list){
            Date createTime = new Date(o.getCreateTime().getTime() + timeout);
            Date nowTime = DateUtils.getNowDate();
            // 超时
            if (nowTime.compareTo(createTime) > 0){
                o.setStatus("2");
                o.setErrorReason("订单已超时");
                orderMapper.updateOrder(o);
            }
        }
    }

}
