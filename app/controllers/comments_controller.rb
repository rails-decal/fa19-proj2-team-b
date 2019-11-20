class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:id])
		@comment = @post.comments.create(comment_params)
		redirect_to post_path(@post)
	end
	
	private comment_params
		params.require(:comment).permit(:username, :body)
	end	
end
