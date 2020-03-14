class ChangeColumnChangeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :change, :float
  end
end
