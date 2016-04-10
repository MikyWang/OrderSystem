package com.gao.OrderSystem.DAO;

import java.util.List;

import com.gao.OrderSystem.Entity.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(String lineId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String lineId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKeyWithBLOBs(Order record);

    int updateByPrimaryKey(Order record);

	List<Order> selectAll();

	List<Order> selectByCustomer(String customerOrOrderName);
}