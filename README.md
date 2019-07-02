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

  



