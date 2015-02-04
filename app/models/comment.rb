class Comment < ActiveRecord::Base
	belongs_to :user, foreign_key: "userid"
	belongs_to :post, foreign_key: "postid"
end
