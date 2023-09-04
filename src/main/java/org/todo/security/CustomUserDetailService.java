package org.todo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.todo.domain.MemberVO;
import org.todo.mapper.MemberMapper;
import org.todo.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService {
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//조회된 DTO 혹은 VO 결과가 있을경우 UserDetails타입으로 변환
		MemberVO mvo = mapper.read(username);
		log.warn(mvo);
		return mvo == null ? null : new CustomUser(mvo);
	}
	
}
