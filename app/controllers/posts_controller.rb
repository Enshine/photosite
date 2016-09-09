class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def index
  	if current_user
      @posts = current_user.posts

    else
      @posts = Post.all
    end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(allow)
  	if @post.save
  		flash[:success] = "Success"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = @post.errors.full_messages
  		redirect_to new_post_path
  	end
  end

  private
  	def allow	
  		params.require(:post).permit(:image, :description)
  	end

end
