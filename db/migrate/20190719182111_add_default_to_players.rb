class AddDefaultToPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:players, :place, 1)
  end
end
