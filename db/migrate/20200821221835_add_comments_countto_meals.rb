class AddCommentsCounttoMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :comments_count, :integer, null: true
  end
end
