class CreateMealFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_foods do |t|
      t.string :meal_id
      t.string :food_id

      t.timestamps
    end
  end
end
