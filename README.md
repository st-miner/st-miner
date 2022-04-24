# st-miner

最新`ETH`/`ETC`矿池代理中转程序`st-miner`
Web界面操作，简单易用，一键安装，小白可以轻松上手。可以自定义抽水，独创PID抽水算法，稳定精准，秒杀一切市面上随机抽水算法。
采用Golang语言开发，性能稳定优异。无视CC，自动CC防护，自动封IP。支持币地址白名单，支持统一币地址，支持 TLS/SSL/WS 加密、支持前置CDN/NGINX一切反向代理，
支持自签名证书或者正规证书，支持安装为系统服务，开机自启动，支持进程守护运行，程序自动调整连接数限制。

## 功能特色

1. 支持主流币种：ETH、ETC、BTC、TON、ERG、RVN、LTC，后续支持更多，欢迎进群反馈。
2. 抽水稳定，创新PID算法，不过抽，不少抽，不像市面上所谓的随机方法，抽水不稳定不准确。
3. 特有的同池模式，专业机器DAG文件不重新下载，实测完美支持：凤凰ETC芯片机，A11-ETH专业机。
4. 兼容模式，实测支持：神马BTC专业机，蚂蚁E7-BTC专业机。
5. 支持ETH和TON双挖，配置方法欢迎进群咨询。
6. 多种挖矿协议支持，完美支持nicehash，stratum。
7. 无视CC，自动CC防护，自动封IP，还支持手动封IP，解封IP。
8. 支持设置币地址白名单，矿机的提交地址，只有在白名单里面中才能连接中转端口，全方位保护中转服务。
9. 支持统一矿机提交币地址，有效拦截矿机内核抽水。
10. 采用Golang语言开发，网络性能优异。
11. 全部web界面操作，简单易用，小白也能轻松驾驭，同时web界面还适配手机，手机上也能轻松操作。
12. 单机4核，4g，稳定带5000+矿机。
13. 中转端口可以开启`ssl/tls`加密模式，配置域名证书和密钥，全程加密，防止被监控。
14. 支持ssl/tls加密协议和tcp协议。
15. 程序支持注册为系统服务，开机自启动，管理端口可以通过配置文件自由修改。
16. 程序还支持手动普通方式运行，此种方式支持`后台守护`参数运行。
17. 程序自动调整ulimit打开文件数限制，无需手动修改系统配置。

## 系统要求

- 系统类型：Linux: `Debian 9`及以后, `Centos 7`及以后, `Ubuntu 12`及以后。
- 依赖命令：iptables，ipset。
- 一台国外VPS，不要用国内VPS！

### 一键安装

如果是小白，可以执行下面的一键安装脚本，就把st-miner安装为了系统服务。

```shell
bash -c "$(curl -s -L https://github.com/st-miner/st-miner/raw/main/install.sh)" @ install
```

默认管理端口是`51301`，假设你的vps的IP是，`192.168.1.1`，那么访问：`http://192.168.1.1:51301` 就可以进入管理登录页面，默认密码是：`123456` 进入后台后，点击右上角头像可以修改密码。

#### 更新程序

更新程序只需要执行：

`
bash -c "$(curl -s -L https://github.com/st-miner/st-miner/raw/main/install.sh)" @ update
`

#### 修改程序配置
st-miner提供了一键配置脚本只需运行：

`
bash -c "$(curl -s -L https://github.com/st-miner/st-miner/raw/main/tools.sh)"
`

可对监听端口 后台密码 cc防护开关 进行控制


## 使用SSL/TLS加密

使用一键配置脚本即可签发SSL证书

## 使用截图

### 登录界面
![1.1](/pic/2.png) 

### 修改密码
![1.2](/pic/4.png) 

### 新增矿池
![1.3](/pic/5.png)

### 设置矿池
![1.4](/pic/6.png)

### 算力实时显示
![1.5](/pic/3.png)

### CC攻击防护管理
![1.1](/pic/1.png)

## 开发抽水比例

```text
根据自定义抽水情况，0.2% - 0.5% 之间。
```

## 算力问题
- 首先不明白什么是算力，什么是提交份额的小白，请先补充这方面的知识。
- 其次要明白什么是按着算力百分比抽水，什么是按着提交份额百分比抽水。
- 抽0.1%的份额，需要的算力不是0.1%，它们之间没有一对一的关系，也没一定的公式计算关系。
- 0.1%的份额需要的算力和当前总算力有关，和矿机的算力大小占比有关，一般情况0.1%的份额需要的算力比0.1%算力要大。
- 本软件是抽水是按着份额百分比抽水的，可以精准控制抽水比例。
- 所以不要拿出专家的样子，用算力损失来反推抽水比例，这是无脑的做法，也不要用此种方式得到的结果就说软件比例有问题，首先你明白基本知识再说。

## 测试问题
1. 测试结论和时间，抽水是要时间的，稳定比例也需要时间，着急的`专家`不要上来几分钟，十来分钟，就说这结果不对劲啊？请至少测试1-2小时再看结果情况。
2. 后台的操作包括矿池修改，抽水账号修改后，需要首页`重载服务`才会生效。
3. 矿机登录成功，就被断开，具体表现就是矿机不断的登录成功，成功后立刻被断开,然后要看你的IP是否被监控了，顺便科普一下"监控"，它不是封你的IP，也不是重置你的tcp连接，
它是发现你的连接发送了挖矿登录的数据包，就会"动作"断开你的tcp，此种情况请你更换IP,或者使用ssl。
4. 矿机直接不能登录，连接超时，应该是IP被屏蔽了，换一个正常IP。
5. 矿机直接不能登录，连接被重置，应该是IP阻断了（换一个正常IP），或者协议不对（使用正确协议）。

