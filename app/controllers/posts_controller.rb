class PostsController < ApplicationController
	respond_to :json

	def index
		respond_with Post.all
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
