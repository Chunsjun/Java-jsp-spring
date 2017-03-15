package org.graz.persistence;

import java.util.List;

import org.graz.domain.User;

public interface UserMapper {
	public User select(User user);
	public void insert(User user);
	public void update(User user);
	public void delete(User user);
	
	public void reJoin(int userNo);
	public void completeDelete(int userNo);
	
	public List<User> viewUsers();
	public User find(User user);
}
