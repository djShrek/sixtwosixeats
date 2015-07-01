class AddUserAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_index  :users, :bio
    add_column :users, :full_name, :string
    add_index  :users, :full_name
    add_column :users, :profile_picture, :text
    add_index  :users, :profile_picture
    add_column :users, :username, :string
    add_index  :users, :username
    add_column :users, :website, :text
    add_index  :users, :website
    add_column :users, :access_token, :text
    add_index  :users, :access_token
  end
end
