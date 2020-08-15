class AddFoodNutrientsToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :nutrient_hash, :string
  end
end
