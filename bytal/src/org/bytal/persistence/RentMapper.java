package org.bytal.persistence;

import org.bytal.domain.Rent;
public interface RentMapper {
	/*대여 정보 등록*/
	public void insert(Rent rent);
	/*대여 정보 조회*/
	public Rent select(Rent	rent);
	/*대여 정보 수정*/
	public void update(Rent rent);
}
