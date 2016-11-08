package org.mybatis.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.domain.Toy;
import org.mybatis.persistence.ToyDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ToyServiceImpl implements ToyService{
	@Resource
	private ToyDao toyDao;
	
	@Override
	public List<Toy> list(Toy toy) {
		return this.toyDao.list(toy);
	}

	@Override
	@Transactional
	public void add(Toy toy) {
		this.toyDao.insert(toy);
	}
	
	@Override
	public Toy view(int toyNo) {
		return this.toyDao.select(toyNo);
	}

	@Override
	public void edit(Toy toy) {
		this.toyDao.update(toy);
	}

	@Override
	public void remove(int toyNo) {
		this.toyDao.delete(toyNo);
	}

}
