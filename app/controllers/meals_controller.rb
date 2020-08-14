class MealsController < ApplicationController
    helper_method :params

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
        @meal = Meal.create(meal_params)
        new_params = meal_params.except(:user_id, :name)
        new_params[:meal_id] = @meal.id
        MealFood.create(new_params)
        if @meal.valid?
        @meal.save
    
        redirect_to meal_path(@meal)
        else 
        render 'new' 
        puts @meal.errors.full_messages
        end
    end

    def meal_params
        params[:meal][:user_id] = current_user.id
        params[:meal][:food_id] = params[:food][:food_id]
        params.require(:meal).permit(:user_id, :name, :food_id)
    end

    def destroy
        @meal = Meal.find_by(id: params[:id])
        @meal.destroy
        redirect_to meals_path
    end

end
