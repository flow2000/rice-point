## 简介

本系统在[若依](https://github.com/yangzongzhuan/RuoYi-Vue)框架为基础进行开发

## 采用的技术栈

后端：SpringBoot、Mybits、jjwt、 Druid、Swagger、fastjson

数据库：MySQL、Redis

前端：

   管理端：Vue2、 Element-ui 、axios、Echarts等

   用户端：微信小程序

## 截图

### 小程序截图

| ![点餐](https://cdn.aqcoder.cn/default/2023/05/19/64670f033f311.jpg) | ![点餐](https://cdn.aqcoder.cn/default/2023/05/19/64670f152293e.jpg) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![点餐](https://cdn.aqcoder.cn/default/2023/05/19/64670f311246a.jpg) | ![点餐](https://cdn.aqcoder.cn/default/2023/05/19/64670f3f1b102.jpg) |
|                                                              |                                                              |

### 后台截图

| ![首页](https://cdn.aqcoder.cn/default/2023/05/19/64670c23035db.jpg) | ![小程序管理](https://cdn.aqcoder.cn/default/2023/05/19/64670c2fb326c.jpg) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![食堂管理](https://cdn.aqcoder.cn/default/2023/05/19/64670c3c750f6.jpg) | ![菜品信息](https://cdn.aqcoder.cn/default/2023/05/19/64670c66c70e7.jpg) |
| ![订单管理](https://cdn.aqcoder.cn/default/2023/05/19/64670c71b2d7a.jpg) | ![投票统计](https://cdn.aqcoder.cn/default/2023/05/19/64670c7d1cdec.jpg) |
|                                                              |                                                              |

## 系统模块设计

总体功能模块结构图：

![总体功能模块结构图](https://cdn.aqcoder.cn/default/2023/05/19/64670e25128a2.png)

## 系统架构设计

### 逻辑视图

![架构图](https://cdn.aqcoder.cn/default/2023/05/19/64670be1c6a38.png)

### 处理视图

小程序用户登录的处理视图：

![登录时序图](https://cdn.aqcoder.cn/default/2023/05/19/64670bf51b1a1.png)

小程序用户订餐的处理视图：

![用户订餐时序图](https://cdn.aqcoder.cn/default/2023/05/19/64670cd637f25.png)

### 物理视图

![物理视图](https://cdn.aqcoder.cn/default/2023/05/19/64670d9cc068e.png)

### 场景视图

小程序用户场景视图：

![小程序用户场景视图](https://cdn.aqcoder.cn/default/2023/05/19/64670dab5ebfa.png)

食堂订单处理员场景视图：

![食堂订单处理员场景视图](https://cdn.aqcoder.cn/default/2023/05/19/64670db70d546.png)

食堂管理员场景视图：

![食堂管理员场景视图](https://cdn.aqcoder.cn/default/2023/05/19/64670dcb87065.png)

超级管理员场景视图：

![超级管理员场景视图](https://cdn.aqcoder.cn/default/2023/05/19/64670dd7be5b1.png)