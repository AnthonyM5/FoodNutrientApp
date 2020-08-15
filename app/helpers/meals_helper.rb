module MealsHelper

    def display_food

        @meal.meal_foods.each do |food| 
            @included = []
            included = Food.where(food.food_id)
            included.each do |f|
                @included << f.name
            end
        end  
    end

    def add_to_meal 
        params[:meal][:food_id].each do |f|
            if !f.empty?
            a = Hash.new
            a[:food_id] = f
            a[:meal_id] = @meal.id
            MealFood.create(a)
            end
        end
    end

end
