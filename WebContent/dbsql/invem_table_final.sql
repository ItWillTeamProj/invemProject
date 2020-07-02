/* 챔피언목록 */
CREATE TABLE champ_list (
	champ_no NUMBER NOT NULL, /* 번호 */
	name VARCHAR2(100) NOT NULL, /* 이름 */
	role VARCHAR2(100) NOT NULL, /* 역할 */
	lane VARCHAR2(100) NOT NULL, /* 포지션 */
	skill VARCHAR2(100) NOT NULL, /* 스킬 */
	nickname VARCHAR2(1000) NOT NULL, /* 별명 */
	describe CLOB NOT NULL /* 설명 */
);

ALTER TABLE champ_list
	ADD
		CONSTRAINT PK_champ_list
		PRIMARY KEY (
			champ_no
		);

/* 댓글테이블 */
CREATE TABLE reply (
	rep_no NUMBER NOT NULL, /* 번호 */
	nonuser_no NUMBER, /* 비회원게시판번호 */
	username VARCHAR2(50) NOT NULL, /* 아이디 */
	reply VARCHAR2(1000) NOT NULL, /* 댓글 */
	regdate DATE DEFAULT sysdate, /* 작성일 */
	user_no NUMBER, /* 회원게시판번호 */
	groupno NUMBER DEFAULT 0, /* 댓글번호 */
	delflag CHAR(1 BYTE) DEFAULT 'N', /* 삭제플레그 */
	pwd VARCHAR2(30) /* 비밀번호 */
);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			rep_no
		);

/* 회원 */
CREATE TABLE member (
	userid VARCHAR2(100) NOT NULL, /* 아이디 */
	nickname VARCHAR2(100) , /* 닉네임 */
	pwd VARCHAR2(100) NOT NULL, /* 비밀번호 */
	name VARCHAR2(50) NOT NULL, /* 이름 */
	dateofbirth VARCHAR2(10) NOT NULL, /* 생년월일 */
	phoneno VARCHAR2(20), /* 휴대폰번호 */
	email VARCHAR2(100), /* 이메일 */
	zipcode VARCHAR2(10) NOT NULL, /* 우편번호 */
	address VARCHAR2(200) NOT NULL, /* 주소 */
	detail VARCHAR2(200), /* 상세주소 */
	sum_name VARCHAR2(60), /* 소환사명 */
	regdate DATE DEFAULT sysdate, /* 등록일 */
	caution NUMBER DEFAULT 0 /* 누적경고 */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			userid
		);


/* 게시판종류 */
CREATE TABLE category (
	cat_code CHAR(1 BYTE) NOT NULL, /* 게시판코드 */
	cat_name VARCHAR2(30) NOT NULL, /* 게시판이름 */
	isuser CHAR(1 BYTE) DEFAULT 'N' NOT NULL /* 제약사항 */
);

ALTER TABLE category
	ADD
		CONSTRAINT PK_category
		PRIMARY KEY (
			cat_code
		);

/* 방명록 */
CREATE TABLE guestbook (
	gno NUMBER NOT NULL, /* 방명록번호 */
	userid VARCHAR2(100) NOT NULL, /* 블로거아이디 */
	writer_id VARCHAR2(100), /* 작성자아이디 */
	g_comment VARCHAR2(1000) , /* 방명록 */
	regdate DATE DEFAULT sysdate /* 작성일 */
);

ALTER TABLE guestbook
	ADD
		CONSTRAINT PK_guestbook
		PRIMARY KEY (
			gno
		);

/* 게시판 */
CREATE TABLE board (
	no NUMBER NOT NULL, /* 번호 */
	userid VARCHAR2(100), /* 유저아이디 */
	nonuserid VARCHAR2(100), /* 비회원아이디 */
	pwd VARCHAR2(20), /* 비밀번호 */
	title VARCHAR2(300), /* 제목 */
	regdate DATE default sysdate, /* 등록일 */
	describe CLOB, /* 내용 */
	views NUMBER default 0, /* 조회수 */
	ipaddress VARCHAR2(30), /* 아이피 */
	delflag CHAR(1) default 'N', /* 삭제플레그 */
	cat_code CHAR(1 BYTE), /* 카테고리코드 */
	champ_no NUMBER, /* 챔피언번호 */
	recommend NUMBER default 0/* 리코멘드 */
);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			no
		);

/* 특성 */
CREATE TABLE ablilty (
	champ_no NUMBER NOT NULL, /* 번호 */
	c_level NUMBER NOT NULL, /* 레벨 */
	attack NUMBER, /* 공격력 */
	a_speed NUMBER, /* 공격속도 */
	health NUMBER, /* 체력 */
	mana NUMBER, /* 마나 */
	h_regeneration NUMBER, /* 체력회복 */
	m_regeneration NUMBER, /* 마나회복 */
	defense NUMBER, /* 방어력 */
	m_defense NUMBER, /* 마방 */
	speed NUMBER, /* 이동속도 */
	crossread NUMBER /* 사거리 */
);

ALTER TABLE ablilty
	ADD
		CONSTRAINT PK_ablilty
		PRIMARY KEY (
			champ_no,
			c_level
		);

/* 추천 */
CREATE TABLE recommend (
	no NUMBER NOT NULL, /* 번호 */
	userid VARCHAR2(100), /* 아이디 */
	board_no NUMBER /* 번호2 */
);

ALTER TABLE recommend
	ADD
		CONSTRAINT PK_recommend
		PRIMARY KEY (
			no
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

ALTER TABLE board
	ADD
		CONSTRAINT FK_category_TO_board
		FOREIGN KEY (
			cat_code
		)
		REFERENCES category (
			cat_code
		);

ALTER TABLE ablilty
	ADD
		CONSTRAINT FK_champ_list_TO_ablilty
		FOREIGN KEY (
			champ_no
		)
		REFERENCES champ_list (
			champ_no
		);

ALTER TABLE recommend
	ADD
		CONSTRAINT FK_board_TO_recommend
		FOREIGN KEY (
			board_no
		)
		REFERENCES board (
			no
		);
		
CREATE SEQUENCE RECOMMEND_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1;

create sequence reply_seq
increment by 1
start with 1
nocache;


create sequence guestbook_seq
increment by 1
start with 1
nocache;

create sequence board_seq
increment by 1
start with 1
nocache;
