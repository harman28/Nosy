class CreateTokens < ActiveRecord::Migration
  def up
    create_table :tokens do |t|
      t.string :value, null: false

      t.timestamps null: false
    end

    add_index :tokens, :value, unique: true
  end

  def down
    drop_table :tokens
  end
end
