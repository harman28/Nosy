class CreateTokens < ActiveRecord::Migration
  def up
    create_table :tokens do |t|
      t.string :value, null: false, index: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :tokens
  end
end
