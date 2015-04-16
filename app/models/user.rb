class User < ActiveRecord::Base
  has_many :itineraries
  has_many :activities, through: :itineraries
  has_many :hotels, through: :itineraries
  has_many :flights, through: :itineraries
  has_many :restaurants, through: :itineraries
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def self.create_with_omniauth(auth)
   create! do |user|
     user.provider = auth["provider"]
     user.uid = auth["uid"]
     user.name = auth["info"]["name"]
   end
 end
 
end
