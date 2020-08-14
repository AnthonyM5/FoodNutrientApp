class MealFoodsController < ApplicationController
    def create
        mealfood = MealFood.create(mealfood_params)
    end

    def mealfood_params
        params.require(:meal_food).permit(:meal_id, :food_id, :user_id)
    end
    
end
