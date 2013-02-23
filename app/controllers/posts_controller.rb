class PostsController < ApplicationController
	respond_to :json

	def index
		respond_with Post.paginate(:per_page => params[:per_page],:page => params[:page])
	end

	def show
		respond_with Post.find(params[:id])
	end

	def create
		respond_with current_user.posts.create(params[:post])
	end

	def update
		respond_with current_user.posts.update(params[:id], params[:post])
	end

	def destroy
		respond_with current_user.posts.destroy(params[:id])
	end
end
