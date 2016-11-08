package org.mybatis.persistence;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.domain.Toy;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ToyDaoImpl implements ToyDao{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Toy> list(Toy toy) {
		return this.sqlSessionTemplate.selectList(
				"org.mybatis.persistence.ToyMapper.list", toy);
	}
	
	@Override
	public void insert(Toy toy) {
		this.sqlSessionTemplate.insert(
				"org.mybatis.persistence.ToyMapper.insert", toy);
		
	}

	@Override
	public Toy select(int toyNo) {
		return this.sqlSessionTemplate.selectOne(
				"org.mybatis.persistence.ToyMapper.select", toyNo);
	}


	@Override
	public void update(Toy toy) {
		this.sqlSessionTemplate.update(
				"org.mybatis.persistence.ToyMapper.update", toy);
		
	}

	@Override
	public void delete(int toyNo) {
		this.sqlSessionTemplate.delete(
				"org.mybatis.persistence.ToyMapper.delete", toyNo);
	}

}
