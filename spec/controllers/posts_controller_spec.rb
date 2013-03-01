require 'spec_helper'

describe PostsController do
  before (:each) do
    create :post
  end
  it "GET /index should respond with posts with JSON format" do
  	get :index, format: :json
  	should respond_with_content_type(:json)
  end

end
