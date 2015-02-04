class Post < ActiveRecord::Base
	belongs_to :user, foreign_key: "userid"
	has_many :comments,foreign_key: "postid"
end
