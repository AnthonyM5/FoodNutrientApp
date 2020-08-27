class CommentsController < ApplicationController
    before_action :authorized 
    
    def index
        if current_user 
            @comments = User.find(current_user.id).comments
        end
    end

    def edit
        @meal = Meal.find_by(id: params[:meal_id])
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        comment = Comment.find_by(id: params[:id])
        comment.update(comments_params)
        if comment.valid?
            redirect_to comment.meal
            else
                flash[:errors] = comment.errors.full_messages
            redirect_to meal_path(@meal)
            end
    end

    def new 
        @meal = Meal.find_by(id: params[:meal_id])
        @comment = Comment.new
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

    def destroy
        @comment = Comment.find_by(id: params[:id])
        if current_user.id == @comment.user_id
        @comment.destroy
        redirect_to comments_path
            else 
            flash[:errors] = "You can only delete your own posts!"
        end

    end

    def comments_params
        params[:comment][:user_id] = current_user.id
        params.require(:comment).permit(:content, :user_id)
    end
    
end
