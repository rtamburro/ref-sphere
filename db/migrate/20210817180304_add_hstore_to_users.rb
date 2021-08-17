class AddHstoreToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :hstore
  end
end
