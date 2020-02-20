class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.text :text,           null: false
      t.integer :price,       null: false

      t.references :category, foreign_key: true
      t.references :brand,    foreign_key: true
      t.references :status,   foreign_key: true

      t.integer :saler_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end