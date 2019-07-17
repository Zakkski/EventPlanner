class AddDefaultValueToEvents < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:events, :open, false)
  end
end
