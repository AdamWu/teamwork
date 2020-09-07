# teamwork

## 介绍
teamwork是任务协同项目管理系统，是在pear project 基础上的JAVA 实现 ，目前项目完成了主要流程，后续会继续完善 ，打造一个实用的协同工作平台。

## 软件架构
JAVA 1.8
MYSQL 8
基于前后端分离架构，服务端主要技术：springboot 、jwt  前端主要是vue;


## 安装

### teamwork-server 服务器端

1.  下载代码、编译打包，部署后端服务
2.  部署前端服务
3.  安装数据库

### teamwork-ui 前端

1.  安装node.js
2.  安装npm淘宝镜像
a.  运行cmd
b.  输入： npm install -g cnpm --registry=https://registry.npm.taobao.org
c.  命令行输入  cnpm install(推荐)  或  npm install
3. 配置后端地址
a.vue.config.js    const DEV_URL = 'http://127.0.0.1:8888/'; 配置后端地址
b.run serve 运行服务
c.http://localhost:8045/ 访问应用 
