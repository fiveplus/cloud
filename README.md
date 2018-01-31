# 碎片云官方介绍

## 项目介绍
集企业内部即时交流、日历任务、微博、项目分类交流与一体的私有云。

## 上传代码方法
1.下载Eclipse<br/>
2.下载maven插件<br/>
3.下载EGIT插件<br/>

## 公网访问地址
<a href="http://sp.bioppp.com/">http://sp.bioppp.com/</a><br/>

## 使用框架
SpringMVC+Hibernate+ehcache+maven

## 历史更新记录

### 2017-02-28
tbl_content新增字段 address(帖子发布地址)
### 2017-03-06 
tel_praise新增表
<img src="http://git.oschina.net/uploads/images/2017/0306/190048_e9d18380_803453.png" width="600" /><br/>

### 2017-3-27 tbl_project新增字段
tbl_project新增字段 status(标记项目是否删除)

### 2017-3-28 
tbl_skin新增表
<img src="http://git.oschina.net/uploads/images/2017/0328/090426_afd8df83_803453.png" width="600" /><br/>

### 2017-4-1 表新增字段
1.tbl_dept add column status,type is varchar(50),not null <br/>
2.tbl_group add column status,type is varchar(50),not null <br/>
3.tbl_level add column status,type is varchar(50),not null <br/>
4.tbl_theme add column status,type is varchar(50),not null <br/>
5.tbl_user add column status,type is varchar(50),not null <br/>

### 2017-4-5 表新增字段
1.sys_log add column is_read,type is varchar(50),not null <br/>

### 2017-4-7 新增表
TABLE NAME : tbl_file <br/>
id ,int ,PK <br/>
file_name ,text <br/>
url ,text <br/>
create_time ,varchar(100) <br/>
user_id ,int ,FK <br/>
content_id ,int ,FK <br/>

### 2017-4-10 tbl_comment新增列
tbl_comment add column comment_id ,type is int,not null <br/>

### 2017-9-14 新增表
TABLE NAME : sys_mail_quartz <br/>
id ,int ,PK <br/>
job_name ,varchar(500) <br/>
cron ,varchar(500) <br/>
user_id ,int ,FK <br/>
create_time ,varchar(50) <br/>
title ,varchar(500) <br/>
content ,text <br/>
status ,varchar(5) <br/>
