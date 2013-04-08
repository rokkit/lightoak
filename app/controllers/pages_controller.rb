class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  	@current_lesson = Post.first()
  end

  def profile
  	@current_lesson = Post.first()
  end

end
