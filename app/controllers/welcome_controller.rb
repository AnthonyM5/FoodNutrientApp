class WelcomeController < ApplicationController

    def home
        render 'home'
    end

    def index
        @meals = Meal.published.order(comments_count: :desc)
    end



end
