package org.todo.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.warn("로그인 성공");
		//권한 체크해서 권한에 해당하는 url 페이지로 이동
		List<String> roleNames = new ArrayList<String>();
		authentication.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		log.warn("로그인 이름 : "+roleNames);
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/main/index");
			return;
		}
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/main/index");
			return;
		}
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/main/index");
			return;
		}
	}
	
}