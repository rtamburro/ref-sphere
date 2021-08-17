class AddPhoneToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cell_phone, :string
    add_column :users, :work_phone, :string
    add_column :users, :home_phone, :string
  end
end
