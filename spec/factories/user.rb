FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'passwords'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end