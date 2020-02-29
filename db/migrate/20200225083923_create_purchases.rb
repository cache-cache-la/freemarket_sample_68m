class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :address, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true
      t.timestamps
    end
  end
end
