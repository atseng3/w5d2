class CreateFriendCircleMemberships < ActiveRecord::Migration
  def change
    create_table :friend_circle_memberships do |t|
      t.integer :member_id, :null => false
      t.integer :circle_id, :null => false

      t.timestamps
    end
  end
end
