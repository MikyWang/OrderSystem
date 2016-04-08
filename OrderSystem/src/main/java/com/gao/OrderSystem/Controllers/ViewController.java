package com.gao.OrderSystem.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@RequestMapping(value = "register.action")
	public String register() {
		return "register";
	}

	@RequestMapping(value = "menu.action")
	public String menu() {
		return "menu";
	}

	@RequestMapping(value = "login.action")
	public String login() {
		return "login";
	}

}
