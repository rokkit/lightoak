# coding: utf-8
require 'spec_helper'

describe PagesController do

  before (:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "with authenticate GET 'index'" do
    it "should be not successful" do
      get 'index'
      response.should_not be_success
    end
    it "should be successful" do
      sign_in @user
      get 'index'
      response.should be_success
    end
  end

  describe "with authenticate GET 'main'" do
    it "should be successful" do
      sign_in @user
      response.should be_success
    end
  end

end
