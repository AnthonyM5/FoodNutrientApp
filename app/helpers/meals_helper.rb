module MealsHelper

    def display_food
        @included = []
        @calculations = 0
        @meal.meal_foods.each do |food| 
            included = Food.where(id: food.food_id)
            included.each do |f|
                @included << f
                @calculations += f.calories.to_i
            end
        end  
       
        @calculations
    end

    # def add_to_meal 
    #     params[:meal][:food_id].each do |f|
    #         if !f.empty?
    #         a = Hash.new
    #         a[:food_id] = f
    #         a[:meal_id] = @meal.id
    #         MealFood.create(a)
    #         end
    #     end
    # end

    def search_foods(query)
        @foods = Food.search_by_query(query)
    end
 

end
