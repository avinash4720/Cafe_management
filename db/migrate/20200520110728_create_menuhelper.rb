class CreateMenuhelper < ActiveRecord::Migration[6.0]
  def change
    create_table :menuhelpers do |t|
      t.bigint :menu_id
      t.bigint :menuitem_id
      t.bigint :category_id
    end
  end
end
