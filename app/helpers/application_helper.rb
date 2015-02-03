module ApplicationHelper
	 def current_user
  	session[:userid] ? User.find(session[:userid]):nil
  end
end
