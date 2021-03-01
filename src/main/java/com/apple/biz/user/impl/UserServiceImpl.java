package com.apple.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.apple.biz.user.UserService;
import com.apple.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired	
	private UserDAO userDAO;
	
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
	}
	
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}
	
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	public UserVO viewUser(UserVO vo) {
		return userDAO.viewUser(vo);
	}
	
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}
	
}