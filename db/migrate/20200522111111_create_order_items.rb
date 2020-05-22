class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.bigint :order_id
      t.string :item_name
      t.float :item_price
      t.bigint :menu_id
      t.integer :incart
      t.timestamps
    end
  end
end
