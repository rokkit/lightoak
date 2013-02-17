class AddNameLastBirthdayPhotoToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :last, :string
  	add_column :users, :photo, :string
  	add_column :users, :birthday, :datetime
  end
end
