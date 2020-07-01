/* è�Ǿ��� */
CREATE TABLE champ_list (
	champ_no NUMBER NOT NULL, /* ��ȣ */
	name VARCHAR2(100) NOT NULL, /* �̸� */
	role VARCHAR2(100) NOT NULL, /* ���� */
	lane VARCHAR2(100) NOT NULL, /* ������ */
	skill VARCHAR2(100) NOT NULL, /* ��ų */
	nickname VARCHAR2(1000) NOT NULL, /* ���� */
	describe CLOB NOT NULL /* ���� */
);

/* ��ȸ���Խ��� */
CREATE TABLE nonuser_board (
	nonuser_no NUMBER NOT NULL, /* ��ȣ */
	title VARCHAR2(300) NOT NULL, /* ���� */
	username VARCHAR2(100) NOT NULL, /* �ۼ��� */
	regdate DATE DEFAULT sysdate, /* ����� */
	pwd VARCHAR2(100) NOT NULL, /* ��й�ȣ */
	describe CLOB NOT NULL, /* ���� */
	recommend NUMBER DEFAULT 0, /* ��õ */
	views NUMBER DEFAULT 0, /* ��ȸ�� */
	ipaddress VARCHAR2(30) NOT NULL, /* ip�ּ� */
	delflag CHAR(1 BYTE) DEFAULT 'N', /* �����÷��� */
	cat_code CHAR(1 BYTE) NOT NULL /* �Խ����ڵ� */
);

ALTER TABLE nonuser_board
	ADD
		CONSTRAINT PK_nonuser_board
		PRIMARY KEY (
			nonuser_no
		);

/* ȸ���Խ��� */
CREATE TABLE user_board (
	user_no NUMBER NOT NULL, /* ��ȣ */
	userid VARCHAR2(100) NOT NULL, /* ���̵� */
	title VARCHAR2(300) NOT NULL, /* ���� */
	regdate DATE DEFAULT sysdate, /* ����� */
	describe CLOB NOT NULL, /* ���� */
	recommend NUMBER DEFAULT 0, /* ��õ */
	views NUMBER DEFAULT 0, /* ��ȸ�� */
	filename VARCHAR2(1000), /* ���ϸ� */
	filesize NUMBER, /* ����ũ�� */
	downcount NUMBER DEFAULT 0, /* �ٿ�ε�� */
	originalfilename VARCHAR2(1000), /* �������� �̸� */
	delflag CHAR(1 BYTE) DEFAULT 'N', /* �����÷��� */
	cat_code CHAR(1 BYTE) NOT NULL /* �Խ����ڵ� */
);

ALTER TABLE user_board
	ADD
		CONSTRAINT PK_user_board
		PRIMARY KEY (
			user_no
		);

/* ������̺� */
CREATE TABLE reply (
	rep_no NUMBER NOT NULL, /* ��ȣ */
	nonuser_no NUMBER, /* ��ȸ���Խ��ǹ�ȣ */
	username VARCHAR2(50) NOT NULL, /* ���̵� */
	reply VARCHAR2(1000) NOT NULL, /* ��� */
	regdate DATE DEFAULT sysdate, /* �ۼ��� */
	user_no NUMBER, /* ȸ���Խ��ǹ�ȣ */
	groupno NUMBER DEFAULT 0, /* ��۹�ȣ */
	sortno NUMBER DEFAULT 0, /* ���Ĺ�ȣ */
	step NUMBER DEFAULT 0, /* ���� */
	delflag CHAR(1 BYTE) DEFAULT 'N' /* �����÷��� */
);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			rep_no
		);

/* ȸ�� */
CREATE TABLE member (
	userid VARCHAR2(100) NOT NULL, /* ���̵� */
	nickname VARCHAR2(100) NOT NULL, /* �г��� */
	pwd VARCHAR2(100) NOT NULL, /* ��й�ȣ */
	name VARCHAR2(50) NOT NULL, /* �̸� */
	dateofbirth VARCHAR2(10) NOT NULL, /* ������� */
	phoneno VARCHAR2(20), /* �޴�����ȣ */
	email VARCHAR2(100), /* �̸��� */
	zipcode VARCHAR2(10) NOT NULL, /* �����ȣ */
	address VARCHAR2(200) NOT NULL, /* �ּ� */
	detail VARCHAR2(200), /* ���ּ� */
	sum_name VARCHAR2(60), /* ��ȯ��� */
	regdate DATE DEFAULT sysdate, /* ����� */
	caution NUMBER DEFAULT 0 /* ������� */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			userid
		);

ALTER TABLE member
	ADD
		CONSTRAINT UK_member
		UNIQUE (
			nickname
		);

/* �Խ������� */
CREATE TABLE category (
	cat_code CHAR(1 BYTE) NOT NULL, /* �Խ����ڵ� */
	cat_name VARCHAR2(30) NOT NULL, /* �Խ����̸� */
	isuser CHAR(1 BYTE) DEFAULT 'N' NOT NULL /* ������� */
);

ALTER TABLE category
	ADD
		CONSTRAINT PK_category
		PRIMARY KEY (
			cat_code
		);

/* ��α� */
CREATE TABLE blog (
	userid VARCHAR2(100) NOT NULL, /* ���̵� */
	write_cnt NUMBER DEFAULT 0, /* �ۼ��Խù��� */
	comment_cnt NUMBER DEFAULT 0, /* �ۼ��ڸ�Ʈ�� */
	mem_level NUMBER DEFAULT 0, /* ���� */
	point NUMBER DEFAULT 0 /* ����Ʈ */
);

/* ���� */
CREATE TABLE guestbook (
	gno NUMBER NOT NULL, /* ���Ϲ�ȣ */
	userid VARCHAR2(100) NOT NULL, /* ���̵� */
	g_comment VARCHAR2(1000) NOT NULL, /* ���� */
	regdate DATE DEFAULT sysdate /* �ۼ��� */
);

ALTER TABLE guestbook
	ADD
		CONSTRAINT PK_guestbook
		PRIMARY KEY (
			gno
		);

ALTER TABLE nonuser_board
	ADD
		CONSTRAINT FK_category_TO_nonuser_board
		FOREIGN KEY (
			cat_code
		)
		REFERENCES category (
			cat_code
		);

ALTER TABLE user_board
	ADD
		CONSTRAINT FK_member_TO_user_board
		FOREIGN KEY (
			userid
		)
		REFERENCES member (
			userid
		);

ALTER TABLE user_board
	ADD
		CONSTRAINT FK_category_TO_user_board
		FOREIGN KEY (
			cat_code
		)
		REFERENCES category (
			cat_code
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_nonuser_board_TO_reply
		FOREIGN KEY (
			nonuser_no
		)
		REFERENCES nonuser_board (
			nonuser_no
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_user_board_TO_reply
		FOREIGN KEY (
			user_no
		)
		REFERENCES user_board (
			user_no
		);

ALTER TABLE blog
	ADD
		CONSTRAINT FK_member_TO_blog
		FOREIGN KEY (
			userid
		)
		REFERENCES member (
			userid
		);

ALTER TABLE guestbook
	ADD
		CONSTRAINT FK_member_TO_guestbook
		FOREIGN KEY (
			userid
		)
		REFERENCES member (
			userid
		);


create sequence user_board_seq
increment by 1
start with 1
nocache;

create sequence zipcode_seq
increment by 1
start with 1
nocache;


create sequence nonuser_board_seq
increment by 1
start with 1
nocache;



create sequence reply_seq
increment by 1
start with 1
nocache;


create sequence guestbook_seq
increment by 1
start with 1
nocache;