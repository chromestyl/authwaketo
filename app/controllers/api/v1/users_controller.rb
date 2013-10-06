class Api::V1::UsersController < ApplicationController
  
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  before_filter :authenticate_user!
  
  
  def following
    @users = current_user.followed_users
  end
  
  def followers
    @users = current_user.followers
  end
  
  def index
    User.all
  end
  
  def destroy
    current_user.destroy
  end
  
end
