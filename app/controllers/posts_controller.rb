class PostsController < ApplicationController
  
  before_action :set_post, only: [:edit, :update, :show, :destroy]



  def index
   

  end

  def edit
  end

  def new
  	 @post=Post.new
     
  end

  def show
    @comment = Comment.new
  end

  def create
   @post = Post.create(post_params)
   redirect_to user_path(current_user), notice: "New post created."
  end

  def update
  
    @post.update(post_params)
    redirect_to @post,notice: "Post Updated."

  end

  def destroy
    @post.destroy
  
   
    redirect_to user_path(@post.user), notice: "Post deleted."
  end



 private
  
 

  def post_params
    params.require(:post).permit(:title, :body).merge(userid: current_user.id)
  end

def set_post
    @post = Post.find(params[:id])
  end




end

