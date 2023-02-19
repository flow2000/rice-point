package com.ruoyi.miniprogram.service.impl;

import com.ruoyi.canteen.domain.Canteen;
import com.ruoyi.miniprogram.mapper.WxCanteenMapper;
import com.ruoyi.miniprogram.service.IWxCanteenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 食堂信息Service业务层处理
 *
 * @author panghai
 * @date 2021-10-06
 */
@Service
public class WxCanteenServiceImpl implements IWxCanteenService {

    @Autowired
    private WxCanteenMapper wxCanteenMapper;

    /**
     * 查询食堂信息
     *
     * @param canteenId 食堂信息主键
     * @return 食堂信息
     */
    @Override
    public Canteen selectCanteenByCanteenId(Long canteenId) {
        return wxCanteenMapper.selectWxCanteenByCanteenId(canteenId);
    }

    /**
     * 查询食堂信息列表
     *
     * @param canteen 食堂信息
     * @return 食堂信息
     */
    @Override
    public List<Canteen> selectCanteenList(Canteen canteen) {
        return wxCanteenMapper.selectWxCanteenList(canteen);
    }
}
