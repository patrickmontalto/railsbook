class FriendshipsController < ApplicationController
  def index
  end
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:success] = "Friend requested."
      redirect_to root_url
    else
      flash[:danger] = "Unable to add friend"
      redirect_to root_url
    end
  end

  def update
    @friendship = Friendship.where(friend_id: current_user, user_id: params[:id]).first
    if current_user.accept_friend(@friendship)
      flash[:success] = "Accepted friend!"
      redirect_to root_url
    else
      flash[:danger] = "Could not accept friend."
      redirect_to root_url 
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:success] = "Successfully unfriended user."
    redirect_to root_url
  end

  private

    def friendship_params
      params.permit(:friendship).require(:user_id, :friend_id, :accepted)
    end
end
