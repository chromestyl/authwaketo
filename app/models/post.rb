class Post < ActiveRecord::Base

  # Later version will add video streaming to the content.
  # For now it will be a string that will link to 
  # Playable Video Content the the Android Application will
  # Use in order to stream videos
  
  belongs_to :user
  
  attr_accessible :title, :content
  
  validates_presence_of :title, :content
  
  default_scope order('created_at DESC')
  
   # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    where("user_id IN (:followed_user_ids) OR user_id = :user_id",
          followed_user_ids: followed_user_ids, user_id: user)
  end
  
end
