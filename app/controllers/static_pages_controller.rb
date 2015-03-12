class StaticPagesController < ApplicationController
  def home
    @post = current_user.posts.build
    @posts = current_user.feed.paginate(:page => params[:page])
  end
end
