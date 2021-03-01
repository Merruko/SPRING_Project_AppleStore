package com.apple.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.apple.biz.user.UserService;
import com.apple.biz.user.UserVO;
import com.apple.biz.user.impl.UserDAO;

@Controller
@SessionAttributes("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//로그인 
	@RequestMapping("/login.do")
	public String login(UserVO vo, UserDAO userDAO, HttpSession session) {
		UserVO user = userDAO.getUser(vo);
		if(user != null) {
			session.setAttribute("userName", user.getName());
			session.setAttribute("userId", user.getId());
			session.setAttribute("userPassword", user.getPassword());
			return "welcome.jsp";
		}
		else return "login.jsp";
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}
	
	//회원등록
		@RequestMapping("/insertUser.do")
		public String insertUser(UserVO vo) {
			userService.insertUser(vo);
			return "login.jsp";
		}
		
	//회원정보수정
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) {
		userService.updateUser(vo);
		return "getUserList.do";
	}
	
	//회원 상세정보
	@RequestMapping("/getUser.do")
	public String viewUser(UserVO vo, Model model) {
		model.addAttribute("user", userService.viewUser(vo));
		return "getUser.jsp";
	}
	
	//회원 목록검색
	@RequestMapping("/getUserList.do")
	public String getUserList(UserVO vo, Model model) {
		model.addAttribute("userList", userService.getUserList(vo));
		return "getUserList.jsp";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserVO vo) {
		userService.deleteUser(vo);
		return "logout.do";
	}

}