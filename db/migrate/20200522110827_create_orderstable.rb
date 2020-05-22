class CreateOrderstable < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.boolean :delivered_status
      t.float :cost
      t.date :date
      t.timestamps

    end
  end
end
