--�½��û���
CREATE table user_(
user_id Number,  --�û�id
User_username Varchar2(20),--�û���
User_password Varchar2(20), --�û�����
User_email Varchar2(50), --�û���������
User_name Varchar2(20), --�û�����
User_phonenumber Varchar2(11), --�û��ֻ���
User_gender Number, --�û��Ա�
User_birthday Date --�û���������
)
--�����û�id������(��ʼֵΪ10000,ÿ������1)
CREATE SEQUENCE sequence_userid 
START WITH 10000 
INCREMENT BY 1

--��Ӳ�������
insert into user_ values(sequence_userid.Nextval,'user','123456','12345678@qq.com','����','1312345678',1,to_date('1997-01-01 08:25:36','yyyy-mm-dd HH:MI:SS'))



