package org.todo.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.todo.domain.MemberVO;

import lombok.Getter;


@Getter
public class CustomUser extends User {
	//User 클래스를 상속받은 클래스는 생성자를 구현해줘야 사용가능
	//AuthVO ---> GrantedAuthority객체로 변환
	private MemberVO member;
	private static final long serialVersionUID = 1L;
	public CustomUser(String username,String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username,password,authorities);
	}
	public CustomUser(MemberVO mvo) {
		super(mvo.getUserid(),mvo.getUserpw(),mvo.getAuthList()
				.stream()
				.map(auth->new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		this.member = mvo;
	}
}
