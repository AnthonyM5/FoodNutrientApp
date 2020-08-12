class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :user_id
      t.string :food_id

      t.timestamps
    end
  end
end
