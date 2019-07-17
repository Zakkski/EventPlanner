class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :title
      t.string :country_code
      t.integer :score, default: 0
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
