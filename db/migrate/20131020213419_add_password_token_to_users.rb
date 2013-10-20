class AddPasswordTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_token, :string
    change_column :users, :password_token, :string, :null => false
  end
end
