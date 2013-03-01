require 'spec_helper'

describe "AuthApi" do
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
