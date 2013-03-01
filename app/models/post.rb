class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :price, :type

  validates_presence_of :content, :price
end
