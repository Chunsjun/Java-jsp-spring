package org.graz.service;

import java.util.List;

import javax.annotation.Resource;

import org.graz.domain.User;
import org.graz.persistence.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserMapper userMapper;

	@Override
	public User view(User user) {
		return this.userMapper.select(user);
	}

	@Override
	public void join(User user) {
		this.userMapper.insert(user);
	}

	@Override
	public void update(User user) {
		this.userMapper.update(user);
	}

	@Override
	public void exit(User user) {
		this.userMapper.delete(user);
	}

	@Override
	public List<User> viewUsers() {
		return this.userMapper.viewUsers();
	}

	@Override
	public void reJoin(int userNo) {
		this.userMapper.reJoin(userNo);
		
	}

	@Override
	public void delete(int userNo) {
		this.userMapper.completeDelete(userNo);
	}
}
