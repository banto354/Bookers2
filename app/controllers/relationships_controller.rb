class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new(followed_id: params[:user_id])
    relationship.follower_id = current_user.id
    relationship.save
    @user = User.find(params[:user_id])
  end

  def destroy
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
    relationship.destroy if relationship
    @user = User.find(params[:user_id])
  end
  
  def followers
    user = User.find(params[:user_id])
    @followers = user.followers 
  end
  
  def following
    user = User.find(params[:user_id])
    @following = user.following
  end
  private
  
  def relationship_params
    params.require(:ralationship).permit(:follower_id, :followed_id)
  end
end

