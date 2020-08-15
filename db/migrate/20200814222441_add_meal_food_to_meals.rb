class AddMealFoodToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :meal_food_ids, :string
  end
end
