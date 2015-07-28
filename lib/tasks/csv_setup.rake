require 'csv'

namespace :csv do
  desc "parse csv files to database"

  task :setup => :environment do
    file = File.read('/assets/csv/*.csv')
    parsed = CSV.parse(file, headers: true)
  end
end
