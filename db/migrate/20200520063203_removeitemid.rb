class Removeitemid < ActiveRecord::Migration[6.0]
  def change
    remove_column :menus, :itemid, :integer
  end
end
