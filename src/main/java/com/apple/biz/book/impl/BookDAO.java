package com.apple.biz.book.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.apple.biz.common.JDBCUtil;
import com.apple.biz.book.BookVO;

@Repository("bookDAO")
public class BookDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	// SQL 명령어들 
	private final String BOOK_INSERT = "INSERT INTO a_booking(seq, goods, quantity, name, contact, email) VALUES ((SELECT nvl(max(seq), 0)+1 FROM a_booking),?,?,?,?,?)";
	private final String BOOK_UPDATE = "UPDATE a_booking SET goods=?, quantity=?, contact=?, email=? WHERE name=?";
	private final String BOOK_DELETE = "DELETE a_booking WHERE name=?";
	private final String BOOK_GET = "SELECT * FROM a_booking WHERE name=?";
	private final String BOOK_LOGIN = "SELECT * FROM a_booking WHERE name=? AND email=?";
	private final String BOOK_LIST = "SELECT * FROM a_booking ORDER BY seq DESC";
	
	// 예약확인
	public BookVO confirm(BookVO vo) {
		BookVO book = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_LOGIN);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getEmail());
			rs = stmt.executeQuery();
			while(rs.next()) {
				book = new BookVO();
				book.setSeq(rs.getInt("SEQ"));
				book.setGoods(rs.getString("GOODS"));
				book.setQuantity(rs.getInt("QUANTITY"));
				book.setName(rs.getString("NAME"));
				book.setContact(rs.getString("CONTACT"));
				book.setEmail(rs.getString("EMAIL"));
				book.setRegDate(rs.getDate("REGDATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return book;
	}
	
	// 예약등록
	public void insertBook(BookVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_INSERT);
			stmt.setString(1, vo.getGoods());
			stmt.setInt(2, vo.getQuantity());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getContact());
			stmt.setString(5, vo.getEmail());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 예약수정 
	public void updateBook(BookVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_UPDATE);
			stmt.setString(1, vo.getGoods());
			stmt.setInt(2, vo.getQuantity());
			stmt.setString(3, vo.getContact());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getName());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 예약삭제 
	public void deleteBook(BookVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_DELETE);
			stmt.setString(1, vo.getName());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 예약조회 
	public BookVO getBook(BookVO vo) {
		BookVO book = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_GET);
			stmt.setString(1, vo.getName());
			rs = stmt.executeQuery();
			while(rs.next()) {
				book = new BookVO();
				book.setSeq(rs.getInt("SEQ"));
				book.setGoods(rs.getString("GOODS"));
				book.setQuantity(rs.getInt("QUANTITY"));
				book.setName(rs.getString("NAME"));
				book.setContact(rs.getString("CONTACT"));
				book.setEmail(rs.getString("EMAIL"));
				book.setRegDate(rs.getDate("REGDATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return book;
	}
	
	// 예약 목록 조회
	public List<BookVO> getBookList(BookVO vo){
		List<BookVO> bookList = new ArrayList<BookVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_LIST);
			rs = stmt.executeQuery();
			while(rs.next()){
				BookVO book = new BookVO();
				book.setSeq(rs.getInt("SEQ"));
				book.setGoods(rs.getString("GOODS"));
				book.setQuantity(rs.getInt("QUANTITY"));
				book.setName(rs.getString("NAME"));
				book.setContact(rs.getString("CONTACT"));
				book.setEmail(rs.getString("EMAIL"));
				book.setRegDate(rs.getDate("REGDATE"));
				bookList.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		} 	
		return bookList;
	}
	
}