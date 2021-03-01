package com.apple.biz.user;

import java.util.List;

public interface UserService {

	// 회원등록 
	void insertUser(UserVO vo);

	// 회원정보 수정 
	void updateUser(UserVO vo);
	
	// 회원탈퇴 
	void deleteUser(UserVO vo);

	// 회원정보 보기
	UserVO getUser(UserVO vo);
	
	// 회원정보 보기(관리자)
	UserVO viewUser(UserVO vo);
	
	// 회원 목록 조회
	List<UserVO> getUserList(UserVO vo);
	
}