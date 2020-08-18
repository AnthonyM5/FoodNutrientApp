class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :meal_id
      t.string :content
      t.string :user_id

      t.timestamps
    end
  end
end
