class SessionsController <ApplicationController
def create
	@user=User.find_by(email: params[:email])
	if @user and @user.password == params[:password]
		flash[:notice]="Successfully signed in!"
		session[:userid]=@user.id
	 else
    flash[:alert]="Something went wrong!!."
    end
  redirect_to @user#its short user_path(id)
end
def destroy
	session[:userid]=nil
	flash[:notice]="Logged out..."
	redirect_to root_path
end
end
