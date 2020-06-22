--sys�� system �������� �α����ؼ� ����� ����, ���̺����̽� �����ϱ�
--sqlplus "/as sysdba  ==>�ý���dba����

--���̺� �����̽� ����
create tablespace lol_invem
datafile 'C:\myoracle\data\lol_invem.dbf' size 48m
extent management local
uniform size 64k
segment space management auto;

--����� ���� ����
create user invem
identified by invem123
default tablespace lol_invem;

--����� ���Ѻο�
grant connect,resource to invem;
--grant connect, dba to herb with admin option;

--�� ���� ���� �ο��ϱ�
grant create view to invem;