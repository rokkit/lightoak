class AddRoomIdToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :room_id, :string
  end
end
