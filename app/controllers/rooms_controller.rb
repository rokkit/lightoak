class RoomsController < ApplicationController
	def create
		config_opentok
		session = @opentok.create_session request.remote_addr
		@post = Post.find(params[:id])

		respond_to do |format|
			if @post.update_attributes(room_id:session.session_id)
				format.html { redirect_to("/room/"+@post.id.to_s) }
			end
		end
	end

	def room
		@post = Post.find(params[:id])
		config_opentok
		@token = @opentok.generate_token session_id:@post.room_id
	end

	def index
		render text:'ok'
	end

private
  def config_opentok
    if @opentok.nil?
      @opentok = OpenTok::OpenTokSDK.new '23302352', 'a282e11ffb0aacd492958e475a330ed3a26a27b5'
    end
  end

end
