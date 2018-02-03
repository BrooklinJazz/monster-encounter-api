class CreateCombats < ActiveRecord::Migration[5.1]
  def change
    create_table :combats do |t|
      t.string :name
      t.text :fight
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
