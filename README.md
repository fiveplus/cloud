# 碎片云官方介绍 (只介绍重大更新事件)
* 项目介绍
集企业内部即时交流、日历任务、微博、项目分类交流与一体的私有云。
* 上传代码方法<br/>
1.下载Eclipse<br/>
2.下载maven插件<br/>
3.下载EGIT插件<br/>
* 测试地址<br/>
<a href="http://220.249.89.138:8092/cloud">http://220.249.89.138:8092/cloud</a><br/>
* 使用框架<br/>
SpringMVC+Hibernate+ehcache+maven
* 2017-02-28<br/>
tbl_content新增字段 address(帖子发布地址)
* 2017-03-06 tel_praise新增表<br/>
<img src="http://git.oschina.net/uploads/images/2017/0306/190048_e9d18380_803453.png" width="600" />
* 2017-3-27 tbl_project新增字段<br/>
tbl_project新增字段 status(标记项目是否删除)
* 2017-3-28 tbl_skin新增表<br/>
<img src="http://git.oschina.net/uploads/images/2017/0328/090426_afd8df83_803453.png" width="600" />
* 2017-4-1 表新增字段<br/>
1.tbl_dept add column status,type is varchar(50),not null <br/>
2.tbl_group add column status,type is varchar(50),not null <br/>
3.tbl_level add column status,type is varchar(50),not null <br/>
4.tbl_theme add column status,type is varchar(50),not null <br/>
5.tbl_user add column status,type is varchar(50),not null <br/>
* 2017-4-5 表新增字段<br/>
1.sys_log add column is_read,type is varchar(50),not null <br/>
* 2017-4-7 新增表<br/>
TABLE NAME : tbl_file <br/>
id ,int ,PK <br/>
file_name ,text <br/>
url ,text <br/>
create_time ,varchar(100) <br/>
user_id ,int ,FK <br/>
content_id ,int ,FK <br/>
