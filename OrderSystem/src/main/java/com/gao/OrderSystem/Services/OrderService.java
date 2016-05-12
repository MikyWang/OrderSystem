package com.gao.OrderSystem.Services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gao.OrderSystem.Common.FileUtil;
import com.gao.OrderSystem.DAO.OrderMapper;
import com.gao.OrderSystem.Entity.Order;
import com.gao.OrderSystem.Entity.OrderTemp;

@Service
public class OrderService {

	@Resource
	OrderMapper orderMapper;

	public OrderTemp selectByPrimaryKey(String lineId) {
		Order order = orderMapper.selectByPrimaryKey(lineId);
		OrderTemp orderTemp = addSuffix(order);
		return orderTemp;
	}

	public OrderTemp addSuffix(Order order) {
		OrderTemp orderTemp = new OrderTemp();
		orderTemp.setOrderId(order.getOrderId());
		orderTemp.setCustomerName(order.getCustomerName());
		orderTemp.setStatus(order.getStatus());
		orderTemp.setStartTime(order.getStartTime());
		orderTemp.setCompleteTime(order.getCompleteTime());
		Date date = new Date();
		String spendMinutes = String.valueOf((date.getTime() - order.getStartTime().getTime()) / 60000);
		if (!orderTemp.getStatus().equals("已完成")) {
			orderTemp.setSpendMinutes(spendMinutes);
		} else {
			orderTemp.setSpendMinutes(
					String.valueOf((orderTemp.getCompleteTime().getTime() - order.getStartTime().getTime()) / 60000));
		}
		orderTemp.setLineNumber(order.getLineNumber());
		orderTemp.setLineId(order.getLineId());
		orderTemp.setLinePrice(order.getLinePrice());
		orderTemp.setLineName(order.getLineName());
		orderTemp.setLinePicture(order.getLinePicturePrefix() + FileUtil.getImageBinary(order.getLinePicture()));
		orderTemp.setLinePicturePrefix(order.getLinePicturePrefix());
		return orderTemp;
	}

	public List<OrderTemp> selectByCustomer(String customerOrOrderName) {
		List<Order> orders = orderMapper.selectByCustomer(customerOrOrderName);
		List<OrderTemp> orderTemps = new ArrayList<>();
		for (Order order : orders) {
			orderTemps.add(addSuffix(order));
		}
		return orderTemps;
	}

	public List<OrderTemp> selectAll() {
		List<Order> orders = orderMapper.selectAll();
		List<OrderTemp> orderTemps = new ArrayList<>();
		for (Order order : orders) {
			orderTemps.add(addSuffix(order));
		}
		return orderTemps;
	}

	public boolean completeOrder(Order order) {
		boolean success = false;
		try {
			orderMapper.updateByPrimaryKeySelective(order);
			success = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return success;
	}

	public void insertSelective(List<Order> orders) {
		String orderId = UUID.randomUUID().toString().substring(0, 16);
		Date startTime = new Date();
		for (int i = 0; i < orders.size(); i++) {
			orders.get(i).setOrderId(orderId);
			orders.get(i).setStartTime(startTime);
			orders.get(i).setStatus("正在制作");
			orders.get(i).setLineNumber(i + 1);
			orderMapper.insertSelective(orders.get(i));
		}
	}

}
