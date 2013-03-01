class PhotosController < ApplicationController
	def upload
		File.open(upload_path, 'wb') do |f|
	    	f.write request.raw_post
	  	end
		render :text => "ok"
	end

private 
	def upload_path # is used in upload and create
  		file_name = params[:name_photo].to_s + '.jpg'
  		File.join(Rails.root, 'public','img', 'uploads', file_name)
	end
end
