package org.bytal.service.webService;

import java.util.List;

import org.bytal.domain.Member;

public interface WebMemberService {
	public List<Member> find();
	public Member view(Member member);
	public void add(Member member);
	public void edit(Member member);
	public void remove(Member member);
}
