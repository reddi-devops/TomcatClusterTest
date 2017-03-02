# TomcatClusterTest

这个是使用docker 来构建1个ngix 和 3个 tomcat，1个redis的集群,并且在tomcat中使用chexagon/redis-session-manager来完成session共享的集群功能的测试项目

## 1. 软件版本
* docker 宿主机 ： centos 7.2 64bit
* docker 

```
docker -v
Docker version 1.12.5, build 047e51b/1.12.5
```

* docker-compse 

```
docker-compose -v
docker-compose version 1.11.1, build 7c5d5e4
```

* redis: 3
* tomcat:  8.5.11
* JRE : openjdk version "1.8.0_121"
* nginx 最新版本

测试通过！

##注意以下几点
* nginx 不是通过 ip_hash的方式进行 tomcat切换。
    ip_hash的方式是通过对客户端访问的ip地址进行hash，并且同一个hash始终落在一个tomcat上。
    如果用ip_hash方式就无法用单一客户端来测试session共享了.
    ip_hash的方式在特定情况下，比如 某台tomcat崩溃，这样分配到这台tomcat上的客户的session就会丢失，这个时候通过session 共享就可以无缝切换到其他tomcat

* session共享的组件是 chexagon/redis-session-manager . 此组件更新比较及时，并且支持 jdk 1.8 和 tomcat 8.5 ，符合我的需求

    https://github.com/chexagon/redis-session-manager

* git pull 整个项目源码。然后在eclipse 中import maven的项目。通过 mvn package 打包生成jar文件。

* 把生成在 target 目录下的 redis-session-manager-with-dependencies-2.1.0.jar  复制到 tomcat的lib目录下

* 配置tomcat进行session共享的信息
   
    ```
    <!-- 配置通过redis 进行session共享 ， 使用的组件是https://github.com/chexagon/redis-session-manager -->
    <Manager
        className="com.crimsonhexagon.rsm.redisson.SingleServerSessionManager"
        endpoint="session-redis:6379" sessionKeyPrefix="_rsm_"
        saveOnChange="true" forceSaveAfterRequest="false"
        dirtyOnMutation="false" ignorePattern=".*\\.(ico|png|gif|jpg|jpeg|swf|css|js)$"
        connectionPoolSize="100" database="0" password="1qaz369*"
        timeout="60000" pingTimeout="1000" retryAttempts="20"
        retryInterval="1000" />
    ```
   
    <font color="red">一定要写在context.xml 里面，不能写在 server.xml 里面。</font>如果写在了server.xml 里面的时候，在mac下可以运行，但是在linux下出现如下错误：
    
    ```
     Error while invoking read-locked operation  java.lang.NullPointerException
    ```

    导致所有会产生session的context都无法访问。

* docker目录下存放了，有的配置docker的信息文件。通过如下命令就可以 生成集群环境

```
docker-compose build
docker-compose up -d 
```

* 访问方法

```
http://docker宿主_ip
```

* 查看结果，确定session共享的集群完成功能.
    每次访问浏览器。
    
    * server 的ip地址在3台tomcat的docker容器的ip地址上切换。
    
    * session id 不变
    
    * 输入一个session的key 和 value ，在所有的tomcat上都可以同步获取
    
    ```
    Server Info=172.18.0.4 : 8080
    Session ID=5C9CF22DF55DD660A36EB013275FCCC9
    ```
