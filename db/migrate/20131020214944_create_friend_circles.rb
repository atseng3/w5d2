class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.string :name, :null => false
      t.integer :owner_id, :null => false

      t.timestamps
    end
    add_index :friend_circles, :owner_id
  end
end
