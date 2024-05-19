class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :item_name
      t.text :item_detail
      t.integer :category_id
      t.integer :condition__id
      t.integer :delivery_charge_id
      t.integer :prefecture_id
      t.integer :delivery_day_id
      t.integer :price
      t.timestamps
    end
  end
end
