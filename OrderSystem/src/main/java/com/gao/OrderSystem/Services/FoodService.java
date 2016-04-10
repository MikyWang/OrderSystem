package com.gao.OrderSystem.Services;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gao.OrderSystem.Common.FileUtil;
import com.gao.OrderSystem.DAO.FoodMapper;
import com.gao.OrderSystem.Entity.Food;
import com.gao.OrderSystem.Entity.FoodTemp;

@Service
public class FoodService {

	@Resource
	FoodMapper foodMapper;

	public List<FoodTemp> selectAllFood() {
		List<Food> foods = foodMapper.selectAll();
		List<FoodTemp> foodTemps = new ArrayList<>();
		for (Food food : foods) {
			FoodTemp foodTemp = new FoodTemp();
			foodTemp.setFoodId(food.getFoodId());
			foodTemp.setFoodName(food.getFoodName());
			foodTemp.setFoodPrice(food.getFoodPrice());
			foodTemp.setFoodPicture(FileUtil.getImageBinary(food.getFoodPicture()));
			foodTemp.setFoodPicturePrefix(food.getFoodPicturePrefix());
			foodTemps.add(foodTemp);
		}
		return foodTemps;
	}

	public int insertFood(Food food) {
		return foodMapper.insertSelective(food);
	}

	public Food selectFood(String foodName) {
		Food food = new Food();
		food.setFoodName(foodName);
		return foodMapper.selectByPrimaryKey(food);
	}

}
