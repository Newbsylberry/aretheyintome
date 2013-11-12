class ChangeIntegerFormatInOptions < ActiveRecord::Migration
  def change
    change_column :options, :value, :decimal
  end
end
