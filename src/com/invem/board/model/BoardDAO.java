package com.invem.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.imvem.db.ConnectionPoolMgr2;
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
		BoardVO vo = null;
		
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
			//1,2 con
			con=pool.getConnection();
			
			//transaction 시작
			con.setAutoCommit(false); //자동 커밋 안되도록 설정
			
			//3. ps
			//[1] update
			String sql="update reply" + 
					" set sortno=sortno+1" + 
					" where groupno=? and sortno>?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getGroupno());
			ps.setInt(2, vo.getSortno());
			
			//4. exec
			
			//[2] insert
			sql="insert into reply(rep_no, username, reply, no, groupno, sortno, step)" + 
					" values(reply_seq.nextval,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getReply());
			ps.setInt(3, vo.getNo());
			ps.setInt(4, vo.getGroupno());
			ps.setInt(5, vo.getSortno()+1);
			ps.setInt(6, vo.getStep() +1);
			
			cnt=ps.executeUpdate();
			System.out.println("답변하기 결과, cnt="+cnt
				+", 매개변수 vo="+vo);
			
			//모두 성공하면 커밋
			con.commit();
		}catch(SQLException e) {
			//하나라도 실패하면 롤백
			con.rollback();
			e.printStackTrace();
		}finally {
			//다시 자동 커밋되도록 설정
			con.setAutoCommit(true);
			
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
			if(!vo.getUserid().equals("unknown")) {
				sql += "(no, userid, title, describe, cat_code)" + 
						" values(board_seq.nextval, ?, ?, ?, ?)";
			}else {
				sql += "(no, userid, nonuserid, pwd, title, describe, ipaddress, cat_code)" + 
						" values(board_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
			}
			
			ps = con.prepareStatement(sql);
			System.out.println("vo = " + vo);
			if(vo.getUserid().equals("unknown")) {
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
				
				ReplyVO vo = new ReplyVO(rep_no, username, reply, regdate, rep_no, rno, sortno, step, delflag);
						
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
	
}
