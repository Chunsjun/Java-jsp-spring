package org.bytal.persistence;

import java.util.List;

import org.bytal.domain.Bicycle;

public interface BicycleMapper {
	/*자전거 목록*/
	public List<Bicycle> list(Bicycle bicycle);
	/*자전거 조회*/
	public Bicycle select(Bicycle bicycle);
	/*자전거 수정*/
	public void update(Bicycle bicycle);
}
