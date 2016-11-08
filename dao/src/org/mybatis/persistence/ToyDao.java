package org.mybatis.persistence;

import java.util.List;

import org.mybatis.domain.Toy;

public interface ToyDao {
	public List<Toy> list(Toy toy);
	public Toy select(int toyNo);
	public void insert(Toy toy);
	public void update(Toy toy);
	public void delete(int toyNo);
}
