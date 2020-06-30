package com.invem.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.invem.db.ConnectionPoolMgr2;
import com.invem.board.model.BoardVO;

public class BoardDAO {
	private ConnectionPoolMgr2 pool;

	public BoardDAO() {
		pool = new ConnectionPoolMgr2();
	}
	/**
	 * 해당 게시판의 글 검색해서 list에 저장
	 *
	 * @param keyword
	 * @param condition
	 * @param code
	 * @return
	 * @throws SQLException
	 */

	public List<BoardVO> searchall(String keyword, String condition, String code) throws SQLException{

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<BoardVO> list = new ArrayList<BoardVO>();

		try {
			con = pool.getConnection();
			String sql = "select * from board";

			if(keyword != null && !keyword.isEmpty()) {	//검색의 경우
				sql += " where " + condition + " like '%'|| ? ||'%' and cat_code =?";
			}else {
				sql += " where cat_code = ?";
			}
			sql += " order by no desc";
			ps = con.prepareStatement(sql);

			if(keyword != null && !keyword.isEmpty()) {	//검색의 경우
				ps.setString(1, keyword);
				ps.setString(2, code);

			}else {
				ps.setString(1, code);
			}
			rs = ps.executeQuery();

			while(rs.next()) {
				int no = rs.getInt("no");
				String userid = rs.getString("userid");
				String nonuserid = rs.getString("nonuserid");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				Timestamp regdate = rs.getTimestamp("regdate");
				String describe = rs.getString("describe");
				int recommend = rs.getInt("recommend");
				int views = rs.getInt("views");
				String filename = rs.getString("filename");
				long filesize = rs.getLong("filesize");
				int downcount = rs.getInt("downcount");
				String originalfilename = rs.getString("originalfilename");
				String ipaddress = rs.getString("ipaddress");
				String delflag = rs.getString("delflag");
				String cat_code = rs.getString("cat_code");

				BoardVO vo = new BoardVO(no, userid, nonuserid, pwd, title, regdate, describe, recommend, views, filename, filesize, downcount, originalfilename, ipaddress, delflag, cat_code);

				list.add(vo);
			}
			System.out.println("list.size = " + list.size());
			return list;

		}finally {
			pool.dbClose(con, ps, rs);

		}


	}

	/**
	 * 글 조회 시 조회수 증가
	 *
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public int updateReadCount(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = pool.getConnection();
			String sql = "update board" +
					" set views = views + 1" +
					" where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);

			int cnt = ps.executeUpdate();
			System.out.println("조회수 증가 결과 , cnt = " + cnt + ", 매개변수 no = " + no);
			return cnt;

		}finally {
			pool.dbClose(con, ps);

		}
	}
	/**
	 * 글번호로 게시글 검색
	 *
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public BoardVO searchByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BoardVO vo = new BoardVO();
		try {
			con = pool.getConnection();
			String sql = "select * from board where no = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, no);

			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setNo(no);
				vo.setUserid(rs.getString("userid"));
				vo.setNonuserid(rs.getString("nonuserid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setTitle(rs.getString("title"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setDescribe(rs.getString("describe"));
				vo.setRecommend(rs.getInt("recommend"));
				vo.setViews(rs.getInt("views"));
				vo.setFilename(rs.getString("filename"));
				vo.setFilesize(rs.getLong("filesize"));
				vo.setDowncount(rs.getInt("downcount"));
				vo.setOriginalfilename(rs.getString("originalfilename"));
				vo.setIpaddress(rs.getString("ipaddress"));
				vo.setDelflag(rs.getString("delflag"));
				vo.setCat_code(rs.getString("cat_code"));
			}
			System.out.println("vo = " + vo + ", 매개변수 no = " + no);
			return vo;
		}finally {
			pool.dbClose(con, ps, rs);

		}

	}

	/**
	 *
	 * 댓글 등록(간소화 예정)
	 *
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int reply(ReplyVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		int cnt=0;
		try {
			con=pool.getConnection();
			//[2] insert
			String sql="insert into reply(rep_no, username, reply, no, groupno, sortno, step, pwd)" +
					" values(reply_seq.nextval,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);

			ps.setString(1, vo.getusername());
			ps.setString(2, vo.getReply());
			ps.setInt(3, vo.getNo());
			ps.setInt(4, vo.getGroupno());
			ps.setInt(5, vo.getSortno()+1);
			ps.setInt(6, vo.getStep() +1);
			ps.setString(7,  vo.getPwd());

			cnt=ps.executeUpdate();
			System.out.println("답변하기 결과, cnt="+cnt
				+", 매개변수 vo="+vo);

			//모두 성공하면 커밋
			con.commit();
		
		}finally {

			pool.dbClose(con, ps);
		}

		return cnt;
	}

	/**
	 * 게시판 글작성 insert
	 *
	 * @param vo
	 * @return
	 * @throws SQLException
	 */

	public int insertBoard(BoardVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = pool.getConnection();

			String sql = "insert into board";
			if(!"unknown".equals(vo.getUserid())) {
				sql += "(no, userid, title, describe, cat_code, champ_no)" +
						" values(board_seq.nextval, ?, ?, ?, ?, ?)";
			}else {
				sql += "(no, userid, nonuserid, pwd, title, describe, ipaddress, cat_code)" +
						" values(board_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
			}

			ps = con.prepareStatement(sql);
			System.out.println("vo = " + vo);
			if("unknown".equals(vo.getUserid())) {
				ps.setString(1, vo.getUserid());
				ps.setString(2, vo.getNonuserid());
				ps.setString(3, vo.getPwd());
				ps.setString(4, vo.getTitle());
				ps.setString(5, vo.getDescribe());
				ps.setString(6, vo.getIpaddress());
				ps.setString(7, vo.getCat_code());
			}else {
				ps.setString(1, vo.getUserid());
				ps.setString(2, vo.getTitle());
				ps.setString(3, vo.getDescribe());
				ps.setString(4, vo.getCat_code());
				ps.setInt(5, vo.getChamp_no());
			}

			int cnt = ps.executeUpdate();
			System.out.println("cnt = " + cnt + ", 매개변수 vo = " + vo);
			return cnt;

		}finally {
			pool.dbClose(con, ps);

		}
	}

	/**
	 * 모든 게시판 글 검색
	 * @return
	 * @throws SQLException
	 */

	public List<BoardVO> selectAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardVO> list = new ArrayList<BoardVO>();


		try{
			con = pool.getConnection();
			String sql = "select * from board order by no desc";
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();

			while(rs.next()) {

				int no = rs.getInt("no");
				String userid = rs.getString("userid");

				String nonuserid = rs.getString("nonuserid");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				Timestamp regdate = rs.getTimestamp("regdate");
				String describe = rs.getString("describe");
				int recommend =rs.getInt("recommend");
				int views = rs.getInt("views");
				String filename = rs.getString("filename");
				long filesize = rs.getLong("filesize");
				int downcount = rs.getInt("downcount");
				String originalfilename = rs.getString("originalfilename");
				String ipaddress = rs.getString("ipaddress");
				String delflag = rs.getString("delflag");
				String cat_code = rs.getString("cat_code");

				BoardVO vo = new BoardVO(no, userid, nonuserid, pwd, title, regdate, describe, recommend, views, filename, filesize, downcount, originalfilename, ipaddress, delflag, cat_code);
				list.add(vo);

			}
			System.out.println("list.size() = " + list.size());
			return list;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}

	/**
	 * 게시글 번호로 해당 게시글의 댓글 목록 찾기
	 *
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public List<ReplyVO> selectReplyByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReplyVO> list = new ArrayList<ReplyVO>();

		try {
			con = pool.getConnection();
			String sql = "select * from reply where groupno = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, no);

			rs = ps.executeQuery();

			while(rs.next()) {
				int rep_no = rs.getInt("rep_no");
				String username = rs.getString("username");
				String  reply = rs.getString("reply");
				Timestamp regdate = rs.getTimestamp("regdate");
				int rno = rs.getInt("no");
				int sortno = no;
				int step = rs.getInt("step");
				String delflag = rs.getString("delflag");
				String pwd = rs.getString("pwd");
				ReplyVO vo = new ReplyVO(rep_no, username, reply, regdate, rep_no, rno, sortno, step, delflag, pwd);

				list.add(vo);

			}
			System.out.println("list.size = " + list.size());
			return list;
		}finally {
			pool.dbClose(con, ps);

		}
	}
	/**
	 * 게시물 총 개수 유저아이디로 검색
	 * @param userid
	 * @return
	 * @throws SQLException
	 */
	public int countByUserid(String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int cnt = 0;

		try {
			con = pool.getConnection();

			String sql = "select count(*) from board where userid = ?";
			ps = con.prepareStatement(sql);

			ps.setString(1, userid);

			rs = ps.executeQuery();

			if(rs.next()) {
				cnt = rs.getInt(1);
			}

			System.out.println("cnt = " + cnt + ", 매개변수 userid = " + userid);
			return cnt;
		}finally {
			pool.dbClose(con, ps, rs);

		}
	}

	/**
	 * 아이디로 게시글 상세 검색
	 * @param userid
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> selectById(String userid) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardVO> list = new ArrayList<BoardVO>();


		try{
			con = pool.getConnection();
			String sql = "select * from board where userid = ? order by no desc";
			ps = con.prepareStatement(sql);

			ps.setString(1, userid);
			rs = ps.executeQuery();

			while(rs.next()) {

				int no = rs.getInt("no");

				String nonuserid = rs.getString("nonuserid");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				Timestamp regdate = rs.getTimestamp("regdate");
				String describe = rs.getString("describe");
				int recommend =rs.getInt("recommend");
				int views = rs.getInt("views");
				String filename = rs.getString("filename");
				long filesize = rs.getLong("filesize");
				int downcount = rs.getInt("downcount");
				String originalfilename = rs.getString("originalfilename");
				String ipaddress = rs.getString("ipaddress");
				String delflag = rs.getString("delflag");
				String cat_code = rs.getString("cat_code");

				BoardVO vo = new BoardVO(no, userid, nonuserid, pwd, title, regdate, describe, recommend, views, filename, filesize, downcount, originalfilename, ipaddress, delflag, cat_code);
				list.add(vo);

			}
			System.out.println("list.size() = " + list.size());
			return list;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}

	public List<BoardVO> selectMainNotice() throws SQLException{
	      Connection con = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;

	      List<BoardVO> list = new ArrayList<BoardVO>();
	      try {
	         con = pool.getConnection();
	         String sql = "select A.* from (select no, title from board order by regdate desc)A" +
	               " where rownum <= 6";
	         ps = con.prepareStatement(sql);
	         rs = ps.executeQuery();

	         while(rs.next()) {
	            BoardVO vo = new BoardVO();

	            vo.setNo(rs.getInt("no"));
	            vo.setTitle(rs.getString("title"));

	            list.add(vo);
	         }
	         System.out.println("list.size() = " + list.size());
	         return list;
	      }finally {
	         pool.dbClose(con, ps, rs);
	      }
	 }

	/**
	 * 24시간 이내 글 new띄울라고 시도중
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public int checkRegdate(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Timestamp regdate = null;
		try {
			con=pool.getConnection();
			String sql = "select regdate from board where no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);

			rs = ps.executeQuery();

			if(rs.next()) {
				regdate = rs.getTimestamp("regdate");
			}

			Date today = new Date();
			long gap=(today.getTime() - regdate.getTime())/1000;
			gap = gap/(60*60);
			System.out.println(gap);
			int result = 0;
			if(gap < 24) {
				result = 1;
			}
			return result;

		}finally {
			pool.dbClose(con, ps, rs);
		}
	}

	public int checkReply(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			String sql = "select count(*) from reply where groupno = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, no);

			rs = ps.executeQuery();

			int result = 0;
			if(rs.next()){
				result = rs.getInt(1);
			}
			return result;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}

	/**
	 * 게시판 글 수정
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int editBoard(BoardVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = pool.getConnection();

			String sql = "update board" +
						" set title = ?, describe = ?" +
						" where no =?";

			ps = con.prepareStatement(sql);
				ps.setString(1, vo.getTitle());
				ps.setString(2, vo.getDescribe());
				ps.setInt(3, vo.getNo());

			int cnt = ps.executeUpdate();
			System.out.println("cnt = " + cnt + ", 매개변수 vo = " + vo);
			return cnt;

		}finally {
			pool.dbClose(con, ps);

		}
	}
	/**
	 * 게시판의 게시글 비밀번호확인
	 * @param no
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public boolean checkPwd(int no, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select pwd from board where no=?";
			ps=con.prepareStatement(sql);

			ps.setInt(1, no);

			//4
			rs=ps.executeQuery();
			boolean result=false;
			if(rs.next()) {
				String dbPwd=rs.getString(1);

				if(dbPwd.equals(pwd)) {
					result=true;  //비밀번호 일치
				}
			}

			System.out.println("비밀번호 체크 결과, result="+result
				+", 매개변수 no="+no+", pwd="+pwd);

			return result;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	
	
	public List<ReplyVO> selectAllReply(String userid) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		try {
			con = pool.getConnection();
			String sql = "select * from reply where username=?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userid);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String delflag = rs.getString("delflag");
				int groupno = rs.getInt("groupno");
				Timestamp regdate = rs.getTimestamp("regdate");
				int rep_no = rs.getInt("rep_no");
				String reply = rs.getString("reply");
				int sortno = rs.getInt("sortno");
				int step = rs.getInt("step");
				String pwd = rs.getString("pwd");
						
				ReplyVO vo = new ReplyVO(no, userid, reply, regdate, rep_no, groupno, sortno, step, delflag, pwd);
				
				list.add(vo);
						
			}
			
			return list;
		}finally {
			pool.dbClose(con, ps, rs);
			
		}
				
	}
	
	public int boardDelete(int no, String code) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "delete from board where no=? and cat_code=?";
			
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, no);
			ps.setString(2, code);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("삭제 결과 cnt = " + cnt + ", 매개변수 no = " + no + ", code = " + code);
			
			return cnt;
			
			
			
		}finally {
			pool.dbClose(con, ps);
		}
	}

	public int replyDelete(int rep_no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "delete from reply where rep_no=?";
			
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, rep_no);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("삭제 결과 cnt = " + cnt + ", 매개변수 rep_no = " + rep_no);
			
			return cnt;
			
			
			
		}finally {
			pool.dbClose(con, ps);
		}
	}
	/**
	 * 댓글의 번호로 비밀번호 확인
	 * @param no
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public boolean checkReplyPwd(int no, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select pwd from reply where rep_no=?";
			ps=con.prepareStatement(sql);

			ps.setInt(1, no);

			//4
			rs=ps.executeQuery();
			boolean result=false;
			if(rs.next()) {
				String dbPwd=rs.getString(1);

				if(dbPwd.equals(pwd)) {
					result=true;  //비밀번호 일치
				}
			}

			System.out.println("비밀번호 체크 결과, result="+result
				+", 매개변수 no="+no+", pwd="+pwd);

			return result;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	
	public List<BoardVO> searchall(int champ_no, String code) throws SQLException{

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<BoardVO> list = new ArrayList<BoardVO>();

		try {
			con = pool.getConnection();
			String sql = "select * from board"
					+ " where champ_no=? and cat_code=?"
					+ " order by no desc";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, champ_no);
			ps.setString(2, code);
			rs = ps.executeQuery();

			while(rs.next()) {
				int no = rs.getInt("no");
				String userid = rs.getString("userid");
				String nonuserid = rs.getString("nonuserid");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				Timestamp regdate = rs.getTimestamp("regdate");
				String describe = rs.getString("describe");
				int recommend = rs.getInt("recommend");
				int views = rs.getInt("views");
				String filename = rs.getString("filename");
				long filesize = rs.getLong("filesize");
				int downcount = rs.getInt("downcount");
				String originalfilename = rs.getString("originalfilename");
				String ipaddress = rs.getString("ipaddress");
				String delflag = rs.getString("delflag");
				String cat_code = rs.getString("cat_code");

				BoardVO vo = new BoardVO(no, userid, nonuserid, pwd, title, regdate, 
						describe, recommend, views, filename, filesize, downcount, 
						originalfilename, ipaddress, delflag, cat_code, champ_no);

				list.add(vo);
			}
			System.out.println("list.size = " + list.size());
			return list;

		}finally {
			pool.dbClose(con, ps, rs);

		}


	}
}
