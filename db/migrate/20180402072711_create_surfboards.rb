class CreateSurfboards < ActiveRecord::Migration[5.1]
  def change
    create_table :surfboards do |t|
      t.string :photo
      t.references :beach, foreign_key: true
      t.string :name
      t.string :description
      t.text :price_hash
      t.string :address
      t.references :user, foreign_key: true
      t.string :board_type
      t.boolean :available

      t.timestamps
    end
  end
end
