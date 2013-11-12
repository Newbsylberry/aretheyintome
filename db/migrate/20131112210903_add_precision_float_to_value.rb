class AddPrecisionFloatToValue < ActiveRecord::Migration
  def change
    change_column(:options, :value, :decimal, :precision => 10, :scale => 2)
  end
end
