package com.ruoyi.miniprogram.mapper;

import com.ruoyi.canteen.domain.Canteen;

import java.util.List;

/**
 * @Author: panghai
 * @Date: 2023/02/18
 * @Description: 食堂Mapper接口
 */
public interface WxCanteenMapper {

    /**
     * 查询食堂信息
     *
     * @param canteenId 食堂信息主键
     * @return 食堂信息
     */
    public Canteen selectWxCanteenByCanteenId(Long canteenId);

    /**
     * 查询食堂信息列表
     *
     * @param canteen 食堂信息
     * @return 食堂信息集合
     */
    public List<Canteen> selectWxCanteenList(Canteen canteen);
}
