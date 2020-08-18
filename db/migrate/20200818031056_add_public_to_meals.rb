class AddPublicToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :public, :boolean, :default => false
  end
end
