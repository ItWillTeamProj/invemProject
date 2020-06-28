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

/* 게시판 */
CREATE TABLE board (
	no NUMBER NOT NULL, /* 번호 */
	userid VARCHAR2(100), /* 아이디 */
	nonuserid VARCHAR2(100), /* 별명(nonuser) */
	pwd VARCHAR2(20), /* 비밀번호(nonuser) */
	title VARCHAR2(300) NOT NULL, /* 제목 */
	regdate DATE DEFAULT sysdate, /* 등록일 */
	describe CLOB NOT NULL, /* 내용 */
	recommend NUMBER DEFAULT 0, /* 추천 */
	views NUMBER DEFAULT 0, /* 조회수 */
	filename VARCHAR2(1000), /* 파일명 */
	filesize NUMBER, /* 파일크기 */
	downcount NUMBER DEFAULT 0, /* 다운로드수 */
	originalfilename VARCHAR2(1000), /* 원본파일 이름 */
	ipaddress VARCHAR2(30), /* ip주소 */
	delflag CHAR(1 BYTE) DEFAULT 'N', /* 삭제플레그 */
	cat_code CHAR(1 BYTE) NOT NULL /* 게시판코드 */
);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			no
		);

/* 댓글테이블 */
CREATE TABLE reply (
	rep_no NUMBER NOT NULL, /* 번호 */
	username VARCHAR2(50) NOT NULL, /* 아이디 */
	reply VARCHAR2(1000) NOT NULL, /* 댓글 */
	regdate DATE DEFAULT sysdate, /* 작성일 */
	no NUMBER, /* 원글 게시판 번호 */
	groupno NUMBER DEFAULT 0, /* 댓글번호 */
	sortno NUMBER DEFAULT 0, /* 정렬번호 */
	step NUMBER DEFAULT 0, /* 차수 */
	delflag CHAR(1 BYTE) DEFAULT 'N' /* 삭제플레그 */
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
	nickname VARCHAR2(100) NOT NULL, /* 닉네임 */
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

ALTER TABLE member
	ADD
		CONSTRAINT UK_member
		UNIQUE (
			nickname
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

/* 블로그 */
CREATE TABLE blog (
	userid VARCHAR2(100) NOT NULL, /* 아이디 */
	write_cnt NUMBER DEFAULT 0, /* 작성게시물수 */
	comment_cnt NUMBER DEFAULT 0, /* 작성코멘트수 */
	mem_level NUMBER DEFAULT 0, /* 레벨 */
	point NUMBER DEFAULT 0 /* 포인트 */
);

/* 방명록 */
CREATE TABLE guestbook (
	gno NUMBER NOT NULL, /* 방명록번호 */
	userid VARCHAR2(100) NOT NULL, /* 아이디 */
	g_comment VARCHAR2(1000) NOT NULL, /* 방명록 */
	regdate DATE DEFAULT sysdate /* 작성일 */
);

ALTER TABLE guestbook
	ADD
		CONSTRAINT PK_guestbook
		PRIMARY KEY (
			gno
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
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

ALTER TABLE reply
	ADD
		CONSTRAINT FK_board_TO_reply
		FOREIGN KEY (
			no
		)
		REFERENCES board (
			no
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



create sequence board_seq
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

