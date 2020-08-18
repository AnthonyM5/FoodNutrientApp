class CommentsController < ApplicationController
    def create
        comment = @meal.comment.create(comment_params)
    end

    def comments_params
        params.require(:comment).permit(:content, :user_id)
    end
end
