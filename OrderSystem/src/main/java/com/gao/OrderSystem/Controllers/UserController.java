package com.gao.OrderSystem.Controllers;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gao.OrderSystem.Entity.User;
import com.gao.OrderSystem.Services.UserService;

@Controller
public class UserController {

	@Resource
	UserService userService;

	@RequestMapping(value = "registing.action", method = RequestMethod.POST)
	@ResponseBody
	public String registing(@RequestBody User user, HttpSession session) {
		userService.insertUser(user);
		User user2 = userService.selectUser(user);
		session.setAttribute("userId", user2.getUserId());
		return "success";
	}

	@RequestMapping(value = "getUser.action")
	@ResponseBody
	public User autoLogin(HttpSession session) {
		User user = new User();
		user.setUserId(session.getAttribute("userId").toString());
		return userService.selectUser(user);
	}

	@RequestMapping(value = "verify.action", method = RequestMethod.POST)
	@ResponseBody
	public boolean verify(@RequestBody User user) {
		boolean success = true;
		User user2 = userService.selectUser(user);
		if (user2 != null) {
			success = false;
		}
		return success;
	}

}