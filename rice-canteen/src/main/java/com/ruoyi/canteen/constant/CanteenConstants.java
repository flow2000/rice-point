package com.ruoyi.canteen.constant;

/**
 * 饭堂常量信息
 *
 * @author panghai
 */
public class CanteenConstants {

    /** 校验返回结果码 */
    public final static String UNIQUE = "0";
    public final static String NOT_UNIQUE = "1";
    public final static String PASS_RULES = "0";
    public final static String NOT_PASS_RULES = "2";
    public final static String EXIST = "0";
    public final static String NOT_EXIST = "3";

    /**
     * 饭堂名称长度限制
     */
    public static final int CANTEENNAME_MIN_LENGTH = 2;
    public static final int CANTEENNAME_MAX_LENGTH = 20;

    /**
     * 人均消费金额限制
     */
    public static final double AVERAGE_MIN = 0.01; //最小金额
    public static final double AVERAGE_MAX = 9999.99; //最大金额
}
