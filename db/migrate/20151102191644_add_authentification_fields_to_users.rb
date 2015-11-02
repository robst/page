class AddAuthentificationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :password, :string
    add_column :users, :password_salt, :string
  end
end
