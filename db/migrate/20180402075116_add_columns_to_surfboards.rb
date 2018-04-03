class AddColumnsToSurfboards < ActiveRecord::Migration[5.1]
  def change
    add_column :surfboards, :first_name, :string
    add_column :surfboards, :last_name, :string
    add_column :surfboards, :profile_photo, :string
    # add_column :surfboards, :description, :string
    add_column :surfboards, :mobile, :string
  end
end
