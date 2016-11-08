package org.bytal.service.webService;

import java.util.List;

import javax.annotation.Resource;

import org.bytal.domain.Member;
import org.bytal.persistence.WebMemberMapper;
import org.springframework.stereotype.Service;

@Service
public class WebMemberServiceImpl implements WebMemberService{
	@Resource
	private WebMemberMapper webMemberMapper;
	
	/* 회원 목록 조회 */
	@Override
	public List<Member> find() {
		// TODO Auto-generated method stub
		return this.webMemberMapper.list();
	}

	/* 회원조회, 로그인, 아이디찾기, 비밀번호찾기 */
	@Override
	public Member view(Member member) {
		// TODO Auto-generated method stub
		return this.webMemberMapper.select(member);
	}
	
	/* 회원 등록 */
	@Override
	public void add(Member member) {
		// TODO Auto-generated method stub
		this.webMemberMapper.insert(member);
	}

	/* 회원 수정 */
	@Override
	public void edit(Member member) {
		// TODO Auto-generated method stub
		this.webMemberMapper.update(member);
	}

	/* 회원 삭제 */
	@Override
	public void remove(Member member) {
		// TODO Auto-generated method stub
		this.webMemberMapper.delete(member);
	}
}
