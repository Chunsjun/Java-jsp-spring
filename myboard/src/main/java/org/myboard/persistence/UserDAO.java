package org.myboard.persistence;

import org.myboard.domain.UserVO;

public interface UserDAO {
	public void join(UserVO vo);
	public UserVO login(UserVO vo);
	
	public UserVO viewUser(int uno);
	public void outUser(int uno);
	
	public UserVO checkUser(UserVO vo);
}
