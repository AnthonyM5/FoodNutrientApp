class WelcomeController < ApplicationController

    def index
        @meals = Meal.published.order(:comments_count)
    end



end
