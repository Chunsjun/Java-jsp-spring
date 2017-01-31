package org.graz.service;

import java.util.List;

import org.graz.domain.User;

public interface UserService {
	public User view(User user);
	public void join(User user);
	public void update(User user);
	public void exit(User user);
	
	public void reJoin(int userNo);
	public void delete(int userNo);
	
	public List<User> viewUsers();
}
