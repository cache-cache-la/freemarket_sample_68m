class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.string :prefecture
      t.string :municipality
      t.string :number
      t.string :building
      t.string :telephone_number
      t.references :user_id
      t.timestamps
    end
  end
end
