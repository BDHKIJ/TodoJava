package org.todo.service;

import org.todo.domain.AuthVO;
import org.todo.domain.MemberVO;
import org.todo.mapper.MemberMapper;
import org.todo.mapper.AuthMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServicelmpi implements MemberService {
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	@Setter(onMethod_ = {@Autowired})
	private AuthMapper amapper;

	@Override
	public void register(MemberVO mvo,AuthVO avo) {
		mapper.insert(mvo);
		amapper.insertauth(avo);
	}
	
	
}
