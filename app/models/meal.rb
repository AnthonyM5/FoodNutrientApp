class Meal < ApplicationRecord
    belongs_to :user
    has_many :meal_foods
    has_many :foods, through: :meal_foods
    has_many :comments 
    has_many :users, through: :comments
    serialize :meal_food_ids
    serialize :food_id
    accepts_nested_attributes_for :comments
    scope :published, -> { where(published: true) }
    
end
