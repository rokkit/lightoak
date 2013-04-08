class PostsController < ApplicationController
	respond_to :json

	def index

		 #format. { Post.paginate(:per_page => params[:per_page],:page => params[:page]) }
		 #format.json { 
		 	render json: Post.paginate(:per_page => params[:per_page],:page => params[:page]),:root => false 
		 #}
	
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
