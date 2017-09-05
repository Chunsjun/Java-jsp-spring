package org.myboard.service;

import org.myboard.domain.UserVO;

public interface UserService {
	
	public void join(UserVO vo);
	public UserVO login(UserVO vo);
	
	public UserVO viewUser(int uno);
	public void outUser(int uno);
}
