package com.apple.biz.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.apple.biz.board.BoardVO;
import com.apple.biz.common.JDBCUtil;

@Repository("boardDAO")	
public class BoardDAO {
	//JDBC 관련변수 
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//SQL명령어들
	private final String EVENT_INSERT = "INSERT INTO a_event(seq, title, writer,content, filename) VALUES ((SELECT nvl(max(seq), 0)+1 FROM a_event),?,?,?,?)";
	private final String EVENT_UPDATE = "UPDATE a_event SET title=?, content=? WHERE seq=?";
	private final String EVENT_DELETE = "DELETE a_event WHERE seq=?";
	private final String EVENT_GET = "SELECT * FROM a_event WHERE seq=?";
	private final String EVENT_LIST = "SELECT * FROM a_event ORDER BY seq DESC";
	
	// 글 등록
	public void insertBoard(BoardVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리 ");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EVENT_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.setString(4, vo.getFileName());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 글 수정 
	public void updateBoard(BoardVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리 ");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EVENT_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
		
	// 글 삭제  
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리 ");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EVENT_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 글 상세조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> JDBC로 getBoard() 기능 처리 ");
		BoardVO board = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EVENT_GET);
			stmt.setInt(1, vo.getSeq());
			rs = stmt.executeQuery();
			while(rs.next()) {
				board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setFileName(rs.getString("FILENAME"));
				board.setRegDate(rs.getDate("REGDATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		} 	
		return board;
	}
	
	// 글 목록 조회
	public List<BoardVO> getBoardList(BoardVO vo){
		System.out.println("===> JDBC로 getBoardList() 기능 처리 ");
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EVENT_LIST);
			rs = stmt.executeQuery();
			while(rs.next()){
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getNString("TITLE"));
				board.setWriter(rs.getNString("WRITER"));
				board.setContent(rs.getNString("CONTENT"));
				board.setFileName(rs.getString("FILENAME"));
				board.setRegDate(rs.getDate("REGDATE"));
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		} 	
		return boardList;
	}

}