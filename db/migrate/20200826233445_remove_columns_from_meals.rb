class RemoveColumnsFromMeals < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :food_id, :string
    remove_column :meals, :meal_food_ids, :string
  end
end
