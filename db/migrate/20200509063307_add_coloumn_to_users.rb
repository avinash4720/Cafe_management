class AddColoumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :name, :string
    add_column :users, :role, :string
  end
end
