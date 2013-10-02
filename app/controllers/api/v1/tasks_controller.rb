class Api::V1::TasksController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Authenticate Before Allowing Access
   before_filter :authenticate_user!

  respond_to :json

  def index
    render :text => '{
  "success":true,
  "info":"ok",
  "data":{
          "tasks":[
                    {"title":"My Niggas Bigga Dan Da Bounca"},
                    {"title":"Dan A Bounca?"}
                  ]
         }
}'
  end
end