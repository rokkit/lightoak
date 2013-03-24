require 'spec_helper'

describe "AuthApi" do
  describe "registration" do
	it "should register new user with valid credintials" do
		user = build :user
		post user_registration_path, {  email:user.email, 
										password:user.password,
										name:user.name,
										last:user.last,
										avatar:user.avatar,
										birthday:user.birthday,
									    format:'json'}
		response.status.should be(200)
	end
  end
  describe "pull token" do
    it "should give tokes with valid credintials" do
  	  user = create :user
      post user_session_path, {email:user.email, password:user.password, format:'json'}
      response.status.should be(200)
      json = ActiveSupport::JSON.decode response.body
      json['authentication_token'].should_not eq('')
    end
  end
end
