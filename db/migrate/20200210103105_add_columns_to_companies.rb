class AddColumnsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :companyName, :string
    add_column :companies, :companySymbol, :string
    add_column :companies, :past, :jsonb
    add_column :companies, :pred, :jsonb
  end
end
