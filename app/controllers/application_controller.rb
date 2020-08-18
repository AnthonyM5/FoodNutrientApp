class ApplicationController < ActionController::Base

    def authorized
        unless current_user
            flash[:errors] = ["Please Login"]
            return redirect_to new_user_session_path
        end
    end
    
end
