# TomcatClusterTest

这个是使用docker 来构建1个ngix 和 3个 tomcat，1个redis的集群,并且在tomcat中使用Pivotal Session Managers 来完成session共享的集群功能的测试项目

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

##注意一下几点
* nginx 不是通过 ip_hash的方式进行 tomcat切换。如果用ip_hash 方式就不需要session共享了
* session共享的组件是 Pivotal Session Managers . 此组件更新比较及时，并且支持 jdk 1.8 和 tomcat 8.5 ，符合我的需求

    https://github.com/pivotalsoftware/session-managers
* Pivotal Session Managers 在1.3 以后版本可以用二进制下载.
下载网址:
https://repo.spring.io/webapp/#/home
查找如下关键词获取
group "com.gopivotal.manager"
name "redis-store"
version "<version>"
* 二进制下载的jar，只需要直接放入tomcat的lib目录下。其他附属类已经打包在这个jar文件中了
* 配置tomcat进行session共享的信息
   
   ```
   <!-- 配置通过redis 进行session共享 ， 使用的组件是  https://github.com/pivotalsoftware/session-managers -->
        <Valve className="com.gopivotal.manager.SessionFlushValve" />
        <Manager   className="org.apache.catalina.session.PersistentManager">
               <Store className="com.gopivotal.manager.redis.RedisStore" host="session-redis" port="6379" password="1qaz369*"/>
        </Manager>
    <!-- 配置结束 -->
    ```
   
    <font color="red">一定要写在context.xml 里面，不能写在 server.xml 里面。</font>如果写在了server.xml 里面的时候，在mac下可以运行，但是在linux下出现如下错误：
    
    ```
     Error while invoking read-locked operation  java.lang.NullPointerException
    ```
导致所有会产生session的context都无法访问。

* docker目录下存放了。所有的配置信息。通过如下命令就可以 生成集群环境

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

PS：
  redis-store-1.3.2.BUILD-20170224.183842-4.jar 这个版本，有个致命bug。 在录入一个session的key和value后，tomcat 集群会无法复制。表现状况是：只有一台或者几台机器可以同步session中的key和value。但是session id 还是一致的。

  修改成 redis-store-1.4.0.BUILD-20160830.204629-3.jar 这个包以后就没有问题了
 


