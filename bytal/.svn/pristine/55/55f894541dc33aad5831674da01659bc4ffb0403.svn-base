package org.bytal.service.deviceService;

import java.util.List;

import javax.annotation.Resource;

import org.bytal.domain.Bicycle;
import org.bytal.domain.Member;
import org.bytal.domain.Rent;
import org.bytal.persistence.BicycleMapper;
import org.bytal.persistence.RentMapper;
import org.bytal.persistence.DeviceMemberMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DeviceServiceImpl implements DeviceService {
	
	@Resource
	private RentMapper rentMapper;
	@Resource
	private BicycleMapper bicycleMapper;
	@Resource
	private DeviceMemberMapper deviceMemberMapper;
	
	/*회원 조회-로그인*/
	@Override
	public Member view(Member member) {
		// TODO Auto-generated method stub
		return this.deviceMemberMapper.select(member);
	}
	
	/* 자전거 목록 조회 */
	@Override
	public List<Bicycle> find(Bicycle bicycle) {
		// TODO Auto-generated method stub
		return this.bicycleMapper.list(bicycle);
	}
	
	@Override
	@Transactional
	/*대여 정보 등록*/
	public void add(Rent rent) {
		/*대여 정보 등록*/
		this.rentMapper.insert(rent);
		
		/*자전거 대여 상태 수정*/
		Bicycle bicycle = new Bicycle();
		bicycle.setBicycleNo(rent.getBicycleNo());
		bicycle.setBicycleStatus("2");

		this.bicycleMapper.update(bicycle);
	}
	/* 자전거 수정 */
	@Override
	public void edit(Bicycle bicycle) {
		// TODO Auto-generated method stub
		this.bicycleMapper.update(bicycle);
	}
	/* 자전거 조회*/
	@Override
	public Bicycle view(Bicycle bicycle) {
		
		return this.bicycleMapper.select(bicycle);
	}
	/*대여 정보 조회*/
	@Override
	public Rent view(Rent rent) {
		return this.rentMapper.select(rent);
		
	}
	/*대여 정보 수정*/
	@Override
	public void edit(Rent rent) {
		/*대여 기록 유지하고 반납처리*/
		rent.setUserStatus("2");
		this.rentMapper.update(rent);
		
		/*자전거 대여 상태 수정*/
		Bicycle bicycle = new Bicycle();
		bicycle.setBicycleNo(rent.getBicycleNo());
		bicycle.setBicycleStatus("1");

		this.bicycleMapper.update(bicycle);
	}
		
}
