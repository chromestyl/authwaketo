class Api::V1::RelationshipsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  before_filter :authenticate_user!
  
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
  end
  
  def destroy
   @user = Relationship.find(params[:id]).followed
   current_user.unfollow!(@user) 
  end
  
  
end
