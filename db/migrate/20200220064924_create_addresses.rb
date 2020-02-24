class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :prefecture, null: false, default: 0
      t.string :municipality, null: false
      t.string :number, null: false
      t.string :building, default: ""
      t.string :telephone_number, default: ""
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
