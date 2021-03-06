class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if(@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end
	
	def update
		@post = Post.find(params[:id])		
		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@post = Post.find(params[:id])		
	end

	def destroy
		@post = Post.find(params[:id])	
		@post.destroy	
		redirect_to posts_path
	end

	def dislike
		@post = Post.find(params[:id])
		if (current_user != nil)
			@dislike = Dislike.where(user: current_user, post: @post).first_or_create
		end
		redirect_to posts_path
	end

	private def post_params
		#params.require(:post).permit(:title, :body)
		params.require(:post).permit(:title, :body, :photo)
	end
end
