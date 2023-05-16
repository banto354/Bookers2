class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new(followed_id: params[:user_id])
    relationship.follower_id = current_user.id
    relationship.save
    redirect_to users_path
  end

  def destroy
  end
  
  private
  
  def relationship_params
    params.require(:ralationship).permit(:follower_id, :followed_id)
  end
end

