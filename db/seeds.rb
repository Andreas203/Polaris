# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

require 'csv'

Company.delete_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'companies_symbols.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  Company.create(companyname: row['Name'], companysymbol: row['Symbol'], past: {"name": "Paint house", "tags": ["Improvements", "Office"], "finished": true}, pred: {"name": "Paint house", "tags": ["Improvements", "Office"], "finished": true},change: row['Change'])
end
