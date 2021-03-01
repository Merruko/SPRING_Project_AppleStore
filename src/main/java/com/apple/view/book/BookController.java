package com.apple.view.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.apple.biz.book.BookService;
import com.apple.biz.book.BookVO;
import com.apple.biz.book.impl.BookDAO;

@Controller
@SessionAttributes("book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	//예약확인
	@RequestMapping("/confirm.do")
	public String confrim(BookVO vo, BookDAO bookDAO, HttpSession session) {
		BookVO book = bookDAO.confirm(vo);
		if(book != null) {
			session.setAttribute("name", book.getName());
			session.setAttribute("goods", book.getGoods());
			session.setAttribute("quantity", book.getQuantity());
			session.setAttribute("contact", book.getContact());
			session.setAttribute("email", book.getEmail());
			return "myBookPage.jsp";
		}
		else return "bookConfirm.jsp";
	}
	
	//예약등록
	@RequestMapping("/insertBook.do")
	public String insertBook(BookVO vo) {
		bookService.insertBook(vo);
		return "welcome.jsp";
	}
	
	//예약수정
	@RequestMapping("/updateBook.do")
	public String updateBook(@ModelAttribute("book") BookVO vo) {
		bookService.updateBook(vo);
		return "getBookList.do";
	}
	
	//예약삭제
	@RequestMapping("/deleteBook.do")
	public String deleteBook(BookVO vo) {
		bookService.deleteBook(vo);
		return "getBookList.do";
	}
	
	//예약상세정보
	@RequestMapping("/getBook.do")
	public String getBook(BookVO vo, Model model) {
		model.addAttribute("book", bookService.getBook(vo));
		return "getBook.jsp";
	}
	
	//예약목록검색
	@RequestMapping("/getBookList.do")
	public String getBookList(BookVO vo, Model model) {
		model.addAttribute("bookList", bookService.getBookList(vo));
		return "getBookList.jsp";
	}
	
}