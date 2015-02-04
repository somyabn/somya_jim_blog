class CommentsController < ApplicationController
  def index
  end

  def edit
  end

  def new
   @comment=Comment.new
  end

  def show
  end


  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.create(comment_params)
    redirect_to post, notice: "New comment created."
  end

  def update
  
 
  end

  def destroy
  

  end



private
 def comment_params
    params.require(:comment).permit(:text_comment).merge(userid: current_user.id)
 
  end








end
