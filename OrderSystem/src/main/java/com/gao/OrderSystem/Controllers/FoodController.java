package com.gao.OrderSystem.Controllers;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gao.OrderSystem.Common.FileUtil;
import com.gao.OrderSystem.Entity.Food;
import com.gao.OrderSystem.Entity.FoodTemp;
import com.gao.OrderSystem.Services.FoodService;

@Controller
public class FoodController {

	@Resource
	FoodService foodService;

	@RequestMapping(value = "uploadFood.action", method = RequestMethod.POST)
	@ResponseBody
	public boolean uploadFood(@RequestBody FoodTemp foodT) {
		boolean success = false;
		byte[] foodPicture = FileUtil.base64StringToImage(foodT.getFoodPicture());
		Food food = new Food();
		food.setFoodName(foodT.getFoodName());
		food.setFoodPrice(foodT.getFoodPrice());
		food.setFoodPicture(foodPicture);
		food.setFoodPicturePrefix(foodT.getFoodPicturePrefix());
		foodService.insertFood(food);
		Food food2 = foodService.selectFood(food.getFoodName());
		if (food2 != null) {
			success = true;
		}
		return success;
	}

	@RequestMapping(value = "getFoods.action")
	@ResponseBody
	public List<FoodTemp> getFoods() {
		return foodService.selectAllFood();
	}
}
