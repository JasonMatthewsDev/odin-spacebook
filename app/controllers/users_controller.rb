class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    if current_user.id == params[:id]
      @user = current_user
    else
      @user = User.find_by(id: params[:id])
    end
  end
end
