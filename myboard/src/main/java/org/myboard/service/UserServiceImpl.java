package org.myboard.service;

import javax.annotation.Resource;

import org.myboard.domain.UserVO;
import org.myboard.persistence.UserDAO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserDAO dao;	
	
	@Override
	public void join(UserVO vo) {
		dao.join(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		return dao.login(vo);
	}

	@Override
	public UserVO viewUser(int uno) {
		return dao.viewUser(uno);
	}

	@Override
	public void outUser(int uno) {
		dao.outUser(uno);
	}

	@Override
	public UserVO checkUser(UserVO vo) {
		return dao.checkUser(vo);
	}

}
