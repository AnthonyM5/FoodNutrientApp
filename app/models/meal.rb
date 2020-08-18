class Meal < ApplicationRecord
    
    belongs_to :user
    has_many :meal_foods
    has_many :foods, through: :meal_foods
    serialize :meal_food_ids
    serialize :food_id
    scope :published, -> { where(published: true) }
    
end
