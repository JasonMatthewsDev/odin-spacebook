class LikesController < ApplicationController
  def create
    post_id = params[:id]
    like = current_user.likes.build(post_id: params[:id])
    
    if like.save
      flash[:success] = "Post liked!"
      redirect_to post_path(post_id)
    else
      flash[:danager] = "I don't know what you're trying to do, but stop it"
      redirect_to root_url
    end
  end
  
  def destroy
    post_id = params[:id]
    like = current_user.likes.find_by(id: post_id)
    
    if like.destroy
      flash[:warning] = "Post is no longer liked!"
      redirect_to root_url
    else  
      flash[:danger] = "I don't know what you're doing, but stop it"
      redirect_to root_url
    end
  end
end
