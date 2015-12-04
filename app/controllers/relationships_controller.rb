class RelationshipsController < ApplicationController
  def create
    @relationship = current_user.relationships.build(:friend_id => params[:friend_id])
    if @relationship.save
      flash[:success] = "Added friend."
      redirect_to root_url
    else
      flash[:danger] = "Unable to add friend"
      redirect_to root_url
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    flash[:success] = "Successfully destroyed relationship."
    redirect_to root_url
  end

  private

    def relationship_params
      params.permit(:relationship).require(:user_id, :friend_id)
    end
end
