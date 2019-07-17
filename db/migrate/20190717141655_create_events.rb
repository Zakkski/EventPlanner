class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.boolean :open
      t.datetime :date

      t.timestamps
    end
  end
end
