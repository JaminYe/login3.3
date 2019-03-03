--新建用户表
CREATE table user_(
user_id Number,  --用户id
User_username Varchar2(20),--用户名
User_password Varchar2(20), --用户密码
User_email Varchar2(50), --用户电子邮箱
User_name Varchar2(20), --用户姓名
User_phonenumber Varchar2(11), --用户手机号
User_gender Number, --用户性别
User_birthday Date --用户出生日期
)
--创建用户id的序列(开始值为10000,每次增加1)
CREATE SEQUENCE sequence_userid 
START WITH 10000 
INCREMENT BY 1

--添加测试数据
insert into user_ values(sequence_userid.Nextval,'user','123456','12345678@qq.com','测试','1312345678',1,to_date('1997-01-01 08:25:36','yyyy-mm-dd HH:MI:SS'))



