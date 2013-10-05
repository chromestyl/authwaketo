class Api::V1::PostsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  before_filter :authenticate_user!
  
  def create
    @post = current_user.posts.build(params[:post]) 
   
    if @post.save
      @post
    else
      render :status  => :unprocessable_entity,
             :json => { :success => false,
                        :info => @posts.errors,
                        :data => {} }
    end 
  end

  def index
    @posts = current_user.posts
  end
end
