class Addimgurl < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :img_url, :text
    add_column :menuitems, :category_id, :bigint
  end
end
