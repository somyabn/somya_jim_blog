module UsersHelper
	

	def show_follow_link
		if !current_user
			 link_to 'follow user', follow_path(@user), method: :post 
		end
	end


end
