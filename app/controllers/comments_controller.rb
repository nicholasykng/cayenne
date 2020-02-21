class CommentsController < ApplicationController
    
    def create
        comment = Comment.create(comments_params)
        redirect_to comment.recipe
    end
    
    private
    def comments_params
        params.require(:comment).permit(:content, :recipe_id, :user_id)
    end

end