class MealFood < ApplicationRecord
    belongs_to :food
    belongs_to :meal
    accepts_nested_attributes_for :meal

    
end
