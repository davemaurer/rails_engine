require 'csv'

namespace :csv do
  desc "parse csv files to database"

  task :setup => :environment do
    file = File.read('./lib/assets/csv/customers.csv')
    parsed = CSV.parse(file, headers: true)
    parsed.each do |row|
      Customer.create(row.to_h)
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/merchants.csv')
    parsed = CSV.parse(file, headers: true)
    parsed.each do |row|
      Merchant.create(row.to_h)
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/items.csv')
    parsed = CSV.parse(file, headers: true)
    parsed.each do |row|
      Item.create(row.to_h)
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/invoices.csv')
    parsed = CSV.parse(file, headers: true)
    parsed.each do |row|
      Invoice.create(row.to_h)
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/invoice_items.csv')
    parsed = CSV.parse(file, headers: true)
    parsed.each do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/transactions.csv')
    parsed = CSV.parse(file, headers: true)
    parsed.each do |row|
      Transaction.create(row.to_h)
    end
  end
end
