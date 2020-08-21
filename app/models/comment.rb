class Comment < ApplicationRecord
    belongs_to :meal, counter_cache: true
    belongs_to :user 
end
