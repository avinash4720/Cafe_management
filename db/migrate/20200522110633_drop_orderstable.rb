class DropOrderstable < ActiveRecord::Migration[6.0]
  def change
    drop_table :orders 
    drop_table :orderitems
  end
end
