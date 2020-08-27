module UsersHelper
    def foods_in_meal(food)
        MealFood.find_by(food_id: food)
    end
end
