class AddUserAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :full_name, :string
    add_column :users, :profile_picture, :text
    add_column :users, :username, :string
    add_column :users, :website, :text
    add_column :users, :access_token, :text

    add_index  :users, :bio
    add_index  :users, :full_name
    add_index  :users, :profile_picture
    add_index  :users, :username
    add_index  :users, :website
    add_index  :users, :access_token
  end
end
