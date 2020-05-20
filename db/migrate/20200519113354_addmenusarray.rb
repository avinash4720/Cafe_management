class Addmenusarray < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :itemid, :integer, array: true,default: []
  end
end
