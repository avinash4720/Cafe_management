class Addcategorie < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :img_url
    end
  end
end
