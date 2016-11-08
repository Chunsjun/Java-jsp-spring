package org.mybatis.service;

import java.util.List;

import org.mybatis.domain.Toy;

public interface ToyService {
	public List<Toy> list(Toy toy);
	public Toy view(int toyNo);
	public void add(Toy toy);
	public void edit(Toy toy);
	public void remove(int toyNo);
}
