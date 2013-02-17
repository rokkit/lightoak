class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :type
      t.decimal :price
      t.references :user

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
