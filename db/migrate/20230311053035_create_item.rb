class CreateItem < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name,       null: false
      t.text    :discription,        null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :price,              null: false
      t.integer :shipping_area_id,   null: false
      t.integer :shipping_day_id,    null: false
      t.integer :shipping_info_id,   null: false
      

      t.timestamps
    end
  end
end
