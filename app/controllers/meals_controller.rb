class MealsController < ApplicationController
    helper_method :params
    include MealsHelper

    def index
        @meals = Meal.all
    end

    def new
        @meal = Meal.new
        @foods = Food.all
    end

    def edit
        @meal = Meal.find_by(id: params[:id])
    end

    def update
        meal = Meal.find_by(id: params[:id])
        
        meal.update(meal_params)
        redirect_to meal_path(meal)
    end

    def show
        @meal = Meal.find_by(id: params[:id])
    end

    def create
        @meal = Meal.create(meal_params)
        if @meal.valid?
        @meal.save
        add_to_meal 
        redirect_to meal_path(@meal)
        else 
        render 'new' 
        puts @meal.errors.full_messages
        end
    end

    def destroy
        @meal = Meal.find_by(id: params[:id])
        @meal.destroy
        redirect_to meals_path
    end

    private

    def meal_params
        params[:meal][:user_id] = current_user.id
        params.require(:meal).permit!
    end

   
end
