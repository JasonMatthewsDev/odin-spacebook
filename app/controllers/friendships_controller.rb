class FriendshipsController < ApplicationController
  before_action :user_friendship?, only: [:udpate, :destroy]
  
  def create
    friendship = Friendship.new(requested_id: params[:requested_id], 
                                requester_id: params[:requester_id],
                                accepted: false)
  
    friendship.save
    
    flash[:success] = "Friend request sent"
    redirect_to root_url
  end

  def destroy
    friendship = Friendship.find_by(id: params[:id])
    
    flash[:danger] = "friend removed"
    friendship.destroy
    redirect_to root_url
  end
  
  def update
    friendship = Friendship.find_by(id: params[:id])
    
    if params[:accepted] == 'true'
      friendship.accepted = true
      friendship.save
      flash[:success] = "friend accepted"
      redirect_to root_url
    else
      flash[:danger] = "I don't know what you're up to, but cut it out"
      redirect_to root_url
    end
  end
  
  private
  
    def user_friendship?
      friendship = Friendship.find_by(id: params[:id])
      
      unless current_user == friendship.requester || current_user == friendship.requested
        flash[:danger] = "you don't have permission to do that"
        redirect_to root_url   
      end
    end
end
