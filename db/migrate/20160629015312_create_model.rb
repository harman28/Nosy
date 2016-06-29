class CreateModel < ActiveRecord::Migration
  def up
    create_table :updates do |t|
      t.string :team_id, null: false, index: true
      t.string :user_id, null: false
      t.string :user_name, null: false
      t.text :text
      t.string :week, null: false, index: true
      t.timestamps null: false
    end
  end

  def down
    drop_table :updates
  end
end
