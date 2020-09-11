[TOC]

### config-service-demo描述:

`config-service-demo` SpringCloud项目多配置中心,并注册至Eureka中
### 基础软件:

1. `github`
2. `jdk1.8`

### 服务启动:

​    确保`scp-eureka`,已经起来。

#### local profile配置文件:

```yaml
 eureka:
   instance:
     hostname: ${eureka.client.instance.hostname} #hostname: 显示在Eureka服务IP地址
     instance-id: ${eureka.client.instance.hostname}:${server.port}
     prefer-ip-address: true # 开启以Ip+端口多方式显示Eureka界面
   client:
     serviceUrl:
       defaultZone: http://${eureka.instance.hostname}:${eureka.instance.port}/eureka/
```



####    启动参数:
```yaml
eureka.client.instance.hostname 为当前服务注册到Eureka上到名字
eureka.instance.host  Eureka服务地址
eureka.instance.port Eureka服务端口
```
#### spring-Boot命令启动:

```markdown
spring-boot:run 
-Deureka.client.instance.hostname=127.0.0.1 
-Deureka.instance.host=127.0.0.1
-Deureka.instance.port=9009 
-f pom.xml
```

## 访问其他服务的配置文件
```
http://localhost:8888/user-service/dev【服务名+环境名】
在配置服务端的加密密码回自动解密显示，客户端加密方式显示
```

```
客户端刷新配置,只能刷新用户自定义配置,像数据等框架自带的不能刷新
http://localhost:5555/actuator/refresh
Application主类中添加
@RefreshScope刷新
```




### docker 打包启动命令
```
打包
docker build -t scp-eureka-server:1.0 .
 运行
docker run -it --rm -p 8888:8888  --name config-service-demo --env profile=local  config-service-demo:1.0
docker run -it --rm -p 9010:9010  --name scp-eureka-server2 --env profile=peer2 scp-eureka-server:1.0
docker run -it --rm -p 9010:9010 --name scp-eureka-server2 --env profile=peer2  scp-eureka-server:1.0


```