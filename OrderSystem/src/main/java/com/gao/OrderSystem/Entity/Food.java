package com.gao.OrderSystem.Entity;

public class Food extends FoodKey {
    private Long foodPrice;

    private String foodPicturePrefix;

    private byte[] foodPicture;

    public Long getFoodPrice() {
        return foodPrice;
    }

    public void setFoodPrice(Long foodPrice) {
        this.foodPrice = foodPrice;
    }

    public String getFoodPicturePrefix() {
        return foodPicturePrefix;
    }

    public void setFoodPicturePrefix(String foodPicturePrefix) {
        this.foodPicturePrefix = foodPicturePrefix == null ? null : foodPicturePrefix.trim();
    }

    public byte[] getFoodPicture() {
        return foodPicture;
    }

    public void setFoodPicture(byte[] foodPicture) {
        this.foodPicture = foodPicture;
    }
}