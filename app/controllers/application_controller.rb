class ApplicationController < ActionController::Base

    def authorized
        unless !!current_user
            flash[:errors]= ["Please Login"]
            return redirect_to '/login'
        end
    end
    
end
