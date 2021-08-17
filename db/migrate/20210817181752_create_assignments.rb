class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.integer :game_id
      t.integer :center_referee_id
      t.integer :assistant_referee_1_id
      t.integer :assistant_referee_2_id
      t.integer :fourth_official_id

      t.timestamps
    end
  end
end
