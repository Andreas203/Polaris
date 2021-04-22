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
  Company.create(companyname: row['Name'], companysymbol: row['Symbol'], past: {"values": [1,2,3,4,5,6,7,8]}, pred: {"values": [1,2,3,4,5,6,7,8]})
end
