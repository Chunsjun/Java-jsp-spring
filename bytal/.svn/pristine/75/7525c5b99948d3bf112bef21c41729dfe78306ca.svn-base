package org.bytal.service.webService;

import java.util.List;

import javax.annotation.Resource;

import org.bytal.domain.Bicycle;
import org.bytal.persistence.WebBicycleMapper;
import org.springframework.stereotype.Service;

@Service
public class WebBicycleServiceImpl implements WebBicycleService{
	@Resource
	private WebBicycleMapper webBicycleMapper;
	/* 자전거 목록 */
	@Override
	public List<Bicycle> find(Bicycle bicycle) {
		// TODO Auto-generated method stub
		return this.webBicycleMapper.list(bicycle);
	}
	/* 자전거 목록 페이징 */
	@Override
	public int count(Bicycle bicycle) {
		// TODO Auto-generated method stub
		return this.webBicycleMapper.count(bicycle);
	}
	/* 자전거 조회 */
	@Override
	public Bicycle select(int bicycleNo) {
		// TODO Auto-generated method stub
		return this.webBicycleMapper.view(bicycleNo);
	}
	/* 자전거 수정 */
	@Override
	public void edit(Bicycle bicycle) {
		// TODO Auto-generated method stub
		this.webBicycleMapper.edit(bicycle);
	}
	/* 자전거 등록 */
	@Override
	public void add(Bicycle bicycle) {
		// TODO Auto-generated method stub
		this.webBicycleMapper.insert(bicycle);
	}
	/* 자전거 삭제 */
	@Override
	public void remove(int bicycle) {
		// TODO Auto-generated method stub
		this.webBicycleMapper.delete(bicycle);
	}	
}
