class CommentsController < ApplicationController
    before_action :authorized 

    def create
        @meal = Meal.find_by(id: params[:meal_id])
        comment = @meal.comments.create(comments_params)
    end

    def comments_params
        params[:comment][:user_id] = current_user.id
        params.require(:comment).permit(:content, :user_id)
    end
end
