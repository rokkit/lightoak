class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:name,:avatar,:last,:photo,:birthday, :password, :remember_me
  #:password_confirmati on, 
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
      :default_url => "/images/:style/missing.png",
      :storage => :s3,
      :s3_credentials => "#{Rails.root}/config/aws.yml",
      :bucket => "lightoak_avatars";

  before_save :ensure_authentication_token
  
  has_many :posts, :dependent => :destroy
  
  validates :name, :last, :email, :password, presence: true
  #validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
  validates_attachment_size :avatar, :less_than => 2.megabyte


end
