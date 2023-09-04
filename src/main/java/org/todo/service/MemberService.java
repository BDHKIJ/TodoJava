package org.todo.service;

import org.todo.domain.AuthVO;
import org.todo.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO mvo,AuthVO avo);
}
