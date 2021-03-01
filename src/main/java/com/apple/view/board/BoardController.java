package com.apple.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.apple.biz.board.BoardService;
import com.apple.biz.board.BoardVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//글등록
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IOException {
		MultipartFile file = vo.getFile();
		String fileName = file.getOriginalFilename();
		vo.setFileName(fileName);
		System.out.println(fileName);
		if(!file.isEmpty()) {
			file.transferTo(new File("C:/workspace/SPRING_Project_AppleStore/src/main/webapp/resources/images/event/"+fileName));
		}
		boardService.insertBoard(vo);
		return "getBoardList.do";
	}
	
	//글수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		boardService.updateBoard(vo);
		return "getBoardList.do";
	}
	
	//글삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "getBoardList.do";
	}
	
	//글상세정보
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "getBoard.jsp";
	}
	
	//글목록검색
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		model.addAttribute("boardList", boardService.getBoardList(vo));
		return "getBoardList.jsp";
	}
	
	//시계
		@RequestMapping(value="/clock.do")
		@ResponseBody
	    public String clickInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
			Date day = new java.util.Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}
			
			String s_add = "0";
			if(second<10) s_add = s_add + second;
			else s_add = Integer.toString(second);
			String CT = hour + ":" + minute + ":" + s_add + " " + am_pm;
	        
	        return CT;
	    }
		
}