class CommentsController < ApplicationController
    before_action :authorized 
    
    def index
        if current_user 
            @comments = User.find(current_user.id).comments
        else
            @comments = Comment.all
        end
    end

    def edit
        @meal = Meal.find_by(id: params[:meal_id])
        @comment = Comment.find_by(params[:comment_id])
    end

    def update
        comment = Comment.find_by(params[:comment_id])
        comment.update(comment_params)
        if comment.valid?
            redirect_to comment.meal
            else
                flash[:errors] = comment.errors.full_messages
            redirect_to meal_path(@meal)
            end
    end

    def create
        @meal = Meal.find_by(id: params[:meal_id])
        comment = @meal.comments.create(comments_params)
        if comment.valid?
        redirect_to comment.meal
        else
            flash[:errors] = comment.errors.full_messages
        redirect_to meal_path(@meal)
        end
    end

    def comments_params
        params[:comment][:user_id] = current_user.id
        params.require(:comment).permit(:content, :user_id)
    end
    
end
