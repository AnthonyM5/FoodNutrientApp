class MealFood < ApplicationRecord
    has_and_belongs_to_many :foods
    belongs_to :meal
    accepts_nested_attributes_for :meal

    
end
