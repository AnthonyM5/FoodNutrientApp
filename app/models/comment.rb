class Comment < ApplicationRecord
    belongs_to :meal, counter_cache: true
    belongs_to :user 
    validates :content, presence: true, uniqueness: true, length: {maximum: 500}
end
