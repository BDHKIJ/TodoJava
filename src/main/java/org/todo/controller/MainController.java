package org.todo.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.todo.domain.DataVO;
import org.todo.service.DataService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {
	@Setter(onMethod_ = {@Autowired})
	private DataService service;
	@Secured("ROLE_USER")
	@GetMapping("list")
	public void dolist(DataVO dvo,Model model) {
		model.addAttribute("dvo",dvo);
	}
	@Secured("ROLE_USER")
	@PostMapping("list")
	public ResponseEntity<List<DataVO>> postlist(DataVO dvo){
		log.info("가공전 dvo : "+dvo);
		List<DataVO> clist = new ArrayList<DataVO>();
		List<DataVO> dlist = new ArrayList<DataVO>();
		String sqldate = dvo.getContentdate();
		SimpleDateFormat smd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat smd2 = new SimpleDateFormat("MMdd");
		SimpleDateFormat smd3 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		SimpleDateFormat smd4 = new SimpleDateFormat("yyyyMMdd");
		Date now = new Date();
		clist = service.show(dvo);
		clist.forEach((list) -> {
			try {
				Date targetdate = smd.parse(list.getContentdate());
				String targetstr = smd.format(targetdate)+" "+list.getEndtime();
				Date td = smd3.parse(targetstr);
				log.info(td);
				if(now.after(td)) {
					log.info("now: "+now);
					log.info("td: "+td);
					dvo.setContentdate(smd2.format(td));
					dvo.setType("md");
					service.del(dvo);
					deleteFile(codes(list.getContfile()));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		});
		dvo.setType("mm");
		dvo.setContentdate(sqldate);
		if(dvo.getType2() != null) {
			String cont = dvo.getContentdate2().replaceAll("-", "");
			dvo.setContentdate(cont);
			dvo.setType(dvo.getType2());
			dvo.setUserid(dvo.getUserid2());
			log.info("가공후 dvo : "+dvo);
		}
		dlist = service.show(dvo);
		return new ResponseEntity<List<DataVO>>(dlist,HttpStatus.OK);
	}
	@GetMapping("index")
	@Secured("ROLE_USER")
	public void doindex() {};
	@Secured("ROLE_USER")
	@GetMapping("view")
	public void doview(DataVO dvo,Model model) {
		SimpleDateFormat smd = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat smd2 = new SimpleDateFormat("yyyy년MM월dd일");
		model.addAttribute("dvo",dvo);
		model.addAttribute("list",service.show(dvo));
		String yyy = "2023"+dvo.getContentdate();
		try {
			Date viewda = smd.parse(yyy);
			String viewtx = smd2.format(viewda);
			model.addAttribute("viewdate",viewtx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Secured("ROLE_USER")
	@GetMapping("register")
	public void doregister(DataVO dvo,Model model) {
		log.info(dvo);
		model.addAttribute("dvo",dvo);
	}
	@Secured("ROLE_USER")
	@PostMapping("register")
	public String postregister(DataVO dvo,RedirectAttributes rttr) {
		service.register(dvo);
		SimpleDateFormat smd = new SimpleDateFormat("MM");
		String cdt = smd.format(new Date());
		dvo.setContentdate(cdt);
		rttr.addAttribute("userid",dvo.getUserid());
		rttr.addAttribute("contentdate",dvo.getContentdate());
		rttr.addAttribute("type",dvo.getType());
		log.info(dvo);
		return "redirect:/main/list";
	}
	@PostMapping("/remove")
	public String postremove(DataVO dvo,RedirectAttributes rttr) {
		log.info(dvo);
		List<DataVO> delist = service.show(dvo);
		delist.forEach((list)->{
			deleteFile(codes(list.getContfile())); 
		});
		rttr.addAttribute("result",service.del(dvo));
		SimpleDateFormat smd = new SimpleDateFormat("MM");
		String cdt = smd.format(new Date());
		dvo.setContentdate(cdt);
		rttr.addAttribute("userid",dvo.getUserid());
		rttr.addAttribute("contentdate",dvo.getContentdate());
		rttr.addAttribute("type","mm");
		return "redirect:/main/list";
	} 
	private void deleteFile(String contfile) {
		Path file = Paths.get("C:\\images\\"+contfile);
		try {
			Files.delete(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private String codes(String contfile) {
		String result = "";
		try {
			result = URLDecoder.decode(contfile,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
