class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,             null: false
      t.text :text,               null: false
      t.integer :stock,           null: false
      t.integer :price,           null: false
      t.references :user_id,      foreign_key:true
      t.references :category_id,  foreign_key:true
      t.references :brand_id,     foreign_key:true
      t.references :status_id,    foreign_key:true 
      t.timestamps
    end
  end
end
