class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :stats
      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
