class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :price, :ptype, :room_id

  validates_presence_of :content, :price

end
