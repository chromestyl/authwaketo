class Post < ActiveRecord::Base

  # Later version will add video streaming to the content.
  # For now it will be a string that will link to 
  # Playable Video Content the the Android Application will
  # Use in order to stream videos
  
  belongs_to :user
  
  attr_accessible :title, :content
  
  validates_presence_of :title, :content
  
  default_scope order('completed ASC, created_at DESC')
  
end
