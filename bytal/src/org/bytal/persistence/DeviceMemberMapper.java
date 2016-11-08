package org.bytal.persistence;

import org.bytal.domain.Member;

public interface DeviceMemberMapper {
	/*회원 정보 조회*/
	public Member select(Member member);
	
}
