class Food < ApplicationRecord
    has_many :meal_foods
    has_many :meals, through: :meal_foods
    serialize :nutrient_hash

    def self.create_by_food_hash(food)
        create(
            name: food["description"],
            nutrient_hash: food["foodNutrients"]
        )
    end

    def self.search_by_query(query)
        where("name LIKE ?", "%#{query}%")
    end

    
end
