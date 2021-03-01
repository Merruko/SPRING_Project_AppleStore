package com.apple.biz.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.apple.biz.book.BookService;
import com.apple.biz.book.BookVO;

@Service("bookService") 
public class BookServiceImpl implements BookService {
	@Autowired	 
	private BookDAO bookDAO;
	
	public void insertBook(BookVO vo) {
		bookDAO.insertBook(vo);
	}
	
	public void updateBook(BookVO vo) {
		bookDAO.updateBook(vo);
	}
	
	public void deleteBook(BookVO vo) {
		bookDAO.deleteBook(vo);
	}
	
	public BookVO getBook(BookVO vo) {
		return bookDAO.getBook(vo);
	}
	
	public List<BookVO> getBookList(BookVO vo){
		return bookDAO.getBookList(vo);
	}
	
}