class WelcomeController < ApplicationController

    def index
        if current_user 
            redirect_to meals_path
        end
    end

    

end
