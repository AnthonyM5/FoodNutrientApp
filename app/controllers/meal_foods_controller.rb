class MealFoodsController < ApplicationController

    def new
        @mealfood = MealFood.new(:meal_id => params[:id])
    end
    
    # def create
    #    @mealfood = MealFood.create(mealfood_params)
    # end

    def mealfood_params
        params.require(:meal_food).permit(meal:[:meal_id, :food_id, :user_id])
    end
    
end
