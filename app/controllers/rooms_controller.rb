class RoomsController < ApplicationController

	def room
		@post = Post.find(params[:id])
		config_opentok
		create_opentok_session @post
		
		@token = @opentok.generate_token session_id:@post.room_id
		respond_to do |format|
			format.html {
				@token
			}
			format.json {
				render json: [post:@post.as_json,token:@token]
			}
		end
	end


private
  def config_opentok
    if @opentok.nil?
      @opentok = OpenTok::OpenTokSDK.new '23302352', 'a282e11ffb0aacd492958e475a330ed3a26a27b5'
    end
  end

  def create_opentok_session(post)
  	session = @opentok.create_session request.remote_addr
	post.update_attributes(room_id:session.session_id) unless @post.room_id
  end

end
