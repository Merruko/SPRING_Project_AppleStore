package com.apple.biz.book;

import java.util.List;

public interface BookService {
	
	// 예약등록 
	void insertBook(BookVO vo);
	
	// 예약수정
	void updateBook(BookVO vo);
	
	// 예약삭제 
	void deleteBook(BookVO vo);
	
	// 예약 상세조회
	BookVO getBook(BookVO vo);
	
	//예약 목록 조회
	List<BookVO> getBookList(BookVO vo);
	
}