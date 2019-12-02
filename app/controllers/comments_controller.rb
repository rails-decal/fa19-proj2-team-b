class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		body = comment_params[:body]
		username = current_user.username
		@comment = @post.comments.create({:body => body, :username => username})
		redirect_to post_path(@post)
	end
	
	def destroy
		@post = Post.find(params[:id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy	
		redirect_to posts_path(@post)
	end

	private def comment_params
		params.require(:comment).permit(:body)
	end	 
end
