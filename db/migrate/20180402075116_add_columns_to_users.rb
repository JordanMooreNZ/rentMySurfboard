class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_photo, :string
    add_column :users, :description, :string
    add_column :users, :mobile, :string
  end
end
