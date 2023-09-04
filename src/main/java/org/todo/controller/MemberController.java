package org.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.todo.domain.AuthVO;
import org.todo.domain.MemberVO;
import org.todo.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	@Setter(onMethod_ = {@Autowired})
	private MemberService service;
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder pwencode;
	
	@GetMapping("/register_member")
	public void domember() {}
	@PostMapping("/register_member")
	public String poasmember(MemberVO mvo,AuthVO avo,RedirectAttributes rttr) {
		log.info(mvo);
		mvo.setUserpw(pwencode.encode(mvo.getUserpw()));
		service.register(mvo, avo);
		rttr.addAttribute("userid", mvo.getUserid());
		return "redirect:/main/list";
	}
}
