class AddColumnChangeToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :change, :integer
  end
end
