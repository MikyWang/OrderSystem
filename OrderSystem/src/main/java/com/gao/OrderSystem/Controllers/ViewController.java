package com.gao.OrderSystem.Controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@RequestMapping(value = "login.action")
	public String test() {
		return "test";
	}

	@RequestMapping(value = "register.action")
	public String register(HttpSession session) {
		return "register";
	}
}
