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
}
