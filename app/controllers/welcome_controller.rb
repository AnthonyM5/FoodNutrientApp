class WelcomeController < ApplicationController

    def index
        @meals = Meal.published
        if current_user 
            redirect_to meals_path
        end
    end

    

end
