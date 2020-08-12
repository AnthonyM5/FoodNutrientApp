class MealsController < ApplicationController

    def index
        @meals = Meal.all
    end

    def new
        @meal = Meal.new
    end

    def show
        @meal = Meal.find_by(id: params[:id])
    end

    def create
        meal = Meal.create(meal_params)
        redirect_to meals_path
    end

    def meal_params
        params.require(:meal).permit(:name, :user_id, :food_id)
    end

end
