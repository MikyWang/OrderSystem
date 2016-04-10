package com.gao.OrderSystem.Controllers;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gao.OrderSystem.Common.FileUtil;
import com.gao.OrderSystem.Entity.Order;
import com.gao.OrderSystem.Entity.OrderTemp;
import com.gao.OrderSystem.Services.OrderService;
import com.gao.OrderSystem.Services.UserService;

@Controller
public class OrderController {

	@Resource
	OrderService orderService;
	@Resource
	UserService userService;

	@RequestMapping(value = "insertOrder.action", method = RequestMethod.POST)
	@ResponseBody
	public String insertOrder(@RequestBody OrderTemp[] orders) {
		List<Order> orderlist = new ArrayList<>();
		for (OrderTemp order : orders) {
			Order order2 = new Order();
			order2.setLineName(order.getLineName());
			order2.setLinePrice(order.getLinePrice());
			order2.setCustomerName(order.getCustomerName());
			order2.setLinePicturePrefix(order.getLinePicturePrefix());
			order2.setLinePicture(FileUtil.base64StringToImage(order.getLinePicture()));
			orderlist.add(order2);
		}
		orderService.insertSelective(orderlist);
		return "success";
	}

	@RequestMapping(value = "getAllOrders.action", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderTemp> getAllOrders() {
		return orderService.selectAll();
	}

	@RequestMapping(value = "getUserOrders.action", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderTemp> getOrders(String customerOrOrderName) {
		return orderService.selectByCustomer(customerOrOrderName);
	}
}
