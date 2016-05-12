package com.gao.OrderSystem.Controllers;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@Resource
	HttpSession session;

	public String verifyUser(String url) {
		String actuallUrl = "menu";
		if (session.getAttribute("userId") != null) {
			actuallUrl = url;
		}
		return actuallUrl;
	}

	@RequestMapping(value = "register.action")
	public String register() {
		return verifyUser("register");
	}

	@RequestMapping(value = "menu.action")
	public String menu() {
		return verifyUser("menu");
	}

	@RequestMapping(value = "login.action")
	public String login() {
		return "login";
	}

	@RequestMapping(value = "modal.action")
	public String Modal() {
		return "Modal";
	}

}
