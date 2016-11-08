package org.mybatis.service;

import java.util.List;

import org.mybatis.domain.Shop;

public interface ShopService {
	public List<Shop> list(Shop shop);
	public Shop view(int shopNo);
	public void add(Shop shop);
	public void edit(Shop shop);
	public void remove(int shopNo);
}
