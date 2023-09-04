package org.todo.mapper;

import org.todo.domain.MemberVO;

public interface MemberMapper {
	public void insert(MemberVO mvo);
	public MemberVO read(String userid);
}
