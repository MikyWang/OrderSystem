package com.gao.OrderSystem.Services;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gao.OrderSystem.DAO.UserMapper;
import com.gao.OrderSystem.Entity.User;

@Service
public class UserService {

	@Resource
	UserMapper userMapper;

	public User selectUser(User user) {
		return userMapper.selectByPrimaryKey(user);
	}

	public int insertUser(User user) {
		return userMapper.insertSelective(user);
	}
}
