package com.gao.OrderSystem.DAO;

import com.gao.OrderSystem.Entity.User;
import com.gao.OrderSystem.Entity.UserKey;

public interface UserMapper {
    int deleteByPrimaryKey(UserKey key);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(UserKey key);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}