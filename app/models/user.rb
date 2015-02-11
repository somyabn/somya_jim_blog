class User < ActiveRecord::Base
	has_many :comments, foreign_key: "userid", dependent: :destroy
	has_many :posts, foreign_key: "userid", dependent: :destroy

	validates :email, presence: true
	has_many :active_relationships,  class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:  :destroy
	  has_many :passive_relationships, class_name:  "Relationship",
	                                  foreign_key: "followed_id",
	                                  dependent:  :destroy
	  has_many :following, through: :active_relationships,  source: :followed
	  has_many :followers, through: :passive_relationships, source: :follower
end
