class User < ActiveRecord::Base
	has_many :comments, foreign_key: "userid"
	has_many :posts, foreign_key: "userid"

	validates :email, presence: true
	
		


end
