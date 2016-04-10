package com.gao.OrderSystem.DAO;

import java.util.List;

import com.gao.OrderSystem.Entity.Food;
import com.gao.OrderSystem.Entity.FoodKey;

public interface FoodMapper {
    int deleteByPrimaryKey(FoodKey key);

    int insert(Food record);

    int insertSelective(Food record);

    Food selectByPrimaryKey(FoodKey key);

	List<Food> selectAll();
    
    int updateByPrimaryKeySelective(Food record);

    int updateByPrimaryKeyWithBLOBs(Food record);

    int updateByPrimaryKey(Food record);
}