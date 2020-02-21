class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :companyName
      t.string :companySymbol
      t.jsonb :past
      t.jsonb :pred

      t.timestamps
    end
  end
end
