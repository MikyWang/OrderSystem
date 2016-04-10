package com.gao.OrderSystem.Entity;

public class FoodTemp extends FoodKey {
	private Long foodPrice;
	private String foodPicturePrefix;
	private String foodPicture;

	public Long getFoodPrice() {
		return foodPrice;
	}

	public String getFoodPicturePrefix() {
		return foodPicturePrefix;
	}

	public void setFoodPicturePrefix(String foodPicturePrefix) {
		this.foodPicturePrefix = foodPicturePrefix;
	}

	public void setFoodPrice(Long foodPrice) {
		this.foodPrice = foodPrice;
	}

	public String getFoodPicture() {
		return foodPicture;
	}

	public void setFoodPicture(String foodPicture) {
		this.foodPicture = foodPicture;
	}
}
