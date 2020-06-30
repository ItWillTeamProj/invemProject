package com.invem.board.model;

import java.sql.SQLException;
import java.util.List;

public class BoardService {
	private BoardDAO dao;

	public BoardService() {
		dao = new BoardDAO();
	}

	public List<BoardVO> searchall(String keyword, String condition, String code) throws SQLException{
		return dao.searchall(keyword, condition, code);
	}

	public List<BoardVO> searchall(int champ_no, String code) throws SQLException{
		return dao.searchall(champ_no, code);
	}
	
	public int updateReadCount(int no) throws SQLException {
		return dao.updateReadCount(no);
	}

	public BoardVO searchByNo(int no) throws SQLException {
		return dao.searchByNo(no);
	}

	public int reply(ReplyVO vo) throws SQLException {
		return dao.reply(vo);
	}

	public int insertBoard(BoardVO vo) throws SQLException {
		return dao.insertBoard(vo);
	}

	public List<BoardVO> selectAll() throws SQLException{
		return dao.selectAll();
	}

	public List<ReplyVO> selectReplyByNo(int no) throws SQLException {
		return dao.selectReplyByNo(no);
	}


	public int countByUserid(String userid) throws SQLException {
		return dao.countByUserid(userid);
	}
	public List<BoardVO> selectById(String userid) throws SQLException{
		return dao.selectById(userid);
	}

	public List<BoardVO> selectMainNotice() throws SQLException{
		return dao.selectMainNotice();
	}

	public int checkRegdate(int no) throws SQLException {
		return dao.checkRegdate(no);
	}

	public int checkReply(int no) throws SQLException {
		return dao.checkReply(no);
	}

	public int editBoard(BoardVO vo) throws SQLException {
		return dao.editBoard(vo);
	}
	public boolean checkPwd(int no, String pwd) throws SQLException {
		return dao.checkPwd(no, pwd);
	}
	
	public List<ReplyVO> selectAllReply(String userid) throws SQLException{
		return dao.selectAllReply(userid);
	}
	
	public int boardDelete(int no, String code) throws SQLException {
		return dao.boardDelete(no, code);
	}
	
	public int replyDelete(int no, String code) throws SQLException {
		return dao.replyDelete(no, code);
	}
	
	public boolean checkReplyPwd(int no, String pwd) throws SQLException {
		return dao.checkReplyPwd(no, pwd);
	}
}
