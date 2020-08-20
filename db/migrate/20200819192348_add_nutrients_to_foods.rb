class AddNutrientsToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :total_lipid, :float
    add_column :foods, :protein, :float
    add_column :foods, :water, :float
    add_column :foods, :carbs, :float
    add_column :foods, :fiber, :float
    add_column :foods, :starch, :float
    add_column :foods, :total_sugar, :float
    add_column :foods, :sucrose, :float
    add_column :foods, :glucose, :float
    add_column :foods, :fructose, :float
    add_column :foods, :lactose, :float
    add_column :foods, :galactose, :float
    add_column :foods, :ash, :float
    add_column :foods, :calcium, :float
    add_column :foods, :iron, :float
    add_column :foods, :magnesium, :float
    add_column :foods, :sodium, :float
    add_column :foods, :zinc, :float
    add_column :foods, :copper, :float
    add_column :foods, :selenium, :float
    add_column :foods, :vitamin_a, :float
    add_column :foods, :vitamin_a_r, :float
    add_column :foods, :vitamin_d, :float
    add_column :foods, :vitamin_e, :float
    add_column :foods, :vitamin_c, :float
    add_column :foods, :thiamin, :float
    add_column :foods, :riboflavin, :float
    add_column :foods, :niacin, :float
    add_column :foods, :pantothenic, :float
    add_column :foods, :vitamin_b6, :float
    add_column :foods, :total_folate, :float
    add_column :foods, :folic_acid, :float
    add_column :foods, :food_folate, :float
    add_column :foods, :folate_dfe, :float
    add_column :foods, :vitamin_b12, :float
    add_column :foods, :cholesterol, :float
    add_column :foods, :sat_fats, :float
    add_column :foods, :poly_unsat_fats, :float
    add_column :foods, :calories, :integer
    add_column :foods, :kj, :integer
    
    

  end
end
