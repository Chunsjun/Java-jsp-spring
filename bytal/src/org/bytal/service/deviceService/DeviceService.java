package org.bytal.service.deviceService;

import java.util.List;

import org.bytal.domain.Bicycle;
import org.bytal.domain.Member;
import org.bytal.domain.Rent;

public interface DeviceService {
	/*회원 조회-로그인*/
	public Member view(Member member);
	/*자전거 목록*/
	public List<Bicycle> find(Bicycle bicycle);
	/*자전거 조회*/
	public Bicycle view(Bicycle bicycle);
	/*대여 정보 등록*/
	public void add(Rent rent);
	/*자전거 대여 상태 수정*/
	public void edit(Bicycle bicycle);
	/*대여 정보 조회*/
	public Rent view(Rent rent);
	/*대여 정보 수정*/
	public void edit(Rent rent);
	
	}
