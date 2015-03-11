class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    
    if comment.save
      flash[:success] = "Commented on post!"
      redirect_to comment.post
    else
      flash[:danger] = "I don't know what you're trying to do, but stop it"
      redirect_to root_url
    end
  end
  
  def destroy
    
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
