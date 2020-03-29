class AddColumnsToCompaniesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :companyname, :string
    add_column :companies, :companysymbol, :string
    add_column :companies, :past, :jsonb
    add_column :companies, :pred, :jsonb
    add_column :companies, :change, :float
  end
end
