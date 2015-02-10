class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
  
  def index

  end
 
  def create
  	
    @user=User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
  	   redirect_to @user,notice: "New user created."
     else
      render 'new'
    end
  end
 
  def edit
    @custom_text="Edit Account"
  end

  def new
    @user=User.new
    @custom_text="Sign Up"
  end

  def show
 
  
  end
 
  def update
    @user=User.update(@user.id, user_params)
    redirect_to @user,notice: "User Updated."
  end

   def destroy
    @user.destroy
    if session[:user_id] == @user.id
      session[:user_id]=nil
    end
    
    redirect_to @user, notice: "Account canceled."
  end



  private
  def set_user
  	@user = User.find(params[:id])
  end
  def user_params
  	params.require(:user).permit(:email, :name, :bio, :username, :password)
  end
end
