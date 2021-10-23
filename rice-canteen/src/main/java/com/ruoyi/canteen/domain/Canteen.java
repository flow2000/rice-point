package com.ruoyi.canteen.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 食堂信息对象 rice_canteen
 *
 * @author panghai
 * @date 2021-10-06
 */
public class Canteen extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 食堂id */
    private Long canteenId;

    /** 详细地址 */
    @Excel(name = "详细地址")
    private String location;

    /** 经纬度 */
    private String tude;

    /** 食堂名称 */
    @Excel(name = "食堂名称")
    private String canteenName;

    /** 食堂图片 */
    private String canteenUrl;

    /** 人均消费 */
    @Excel(name = "人均消费")
    private BigDecimal average;

    /** 负责人 */
    @Excel(name = "负责人")
    private String leader;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 食堂状态（0正常 1停用） */
    @Excel(name = "食堂状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setCanteenId(Long canteenId)
    {
        this.canteenId = canteenId;
    }

    public Long getCanteenId()
    {
        return canteenId;
    }
    public void setLocation(String location)
    {
        this.location = location;
    }

    public String getLocation()
    {
        return location;
    }
    public void setTude(String tude)
    {
        this.tude = tude;
    }

    public String getTude()
    {
        return tude;
    }
    public void setCanteenName(String canteenName)
    {
        this.canteenName = canteenName;
    }

    public String getCanteenName()
    {
        return canteenName;
    }
    public void setCanteenUrl(String canteenUrl)
    {
        this.canteenUrl = canteenUrl;
    }

    public String getCanteenUrl()
    {
        return canteenUrl;
    }
    public void setAverage(BigDecimal average)
    {
        this.average = average;
    }

    public BigDecimal getAverage()
    {
        return average;
    }
    public void setLeader(String leader)
    {
        this.leader = leader;
    }

    public String getLeader()
    {
        return leader;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone()
    {
        return phone;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getEmail()
    {
        return email;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("canteenId", getCanteenId())
                .append("location", getLocation())
                .append("tude", getTude())
                .append("canteenName", getCanteenName())
                .append("canteenUrl", getCanteenUrl())
                .append("average", getAverage())
                .append("leader", getLeader())
                .append("phone", getPhone())
                .append("email", getEmail())
                .append("status", getStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("delFlag", getDelFlag())
                .toString();
    }
}
