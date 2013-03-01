# coding: utf-8
require 'rspec/mocks'

FactoryGirl.define do
  factory :user do
  	name Faker::Name.first_name
  	last Faker::Name.last_name
    email Faker::Internet.email
    password 'password'
    birthday Date.current
    authentication_token "token"
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :post do
    content 'lorem ipsum content на скрипке играть научу!'
    price 10
    user
  end
end