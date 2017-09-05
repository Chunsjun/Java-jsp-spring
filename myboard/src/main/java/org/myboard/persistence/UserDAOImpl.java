package org.myboard.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.myboard.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession session;
	private String namespace = "org.myboard.mapper.userMapper";

	@Override
	public void join(UserVO vo) {
		session.insert(namespace+".join",vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		return session.selectOne(namespace+".login", vo);
	}

	@Override
	public UserVO viewUser(int uno) {
		return session.selectOne(namespace+".viewUser", uno);
	}

	@Override
	public void outUser(int uno) {
		session.update(namespace+".outUser", uno);
	}

}
