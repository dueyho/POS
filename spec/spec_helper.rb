require 'active_record'
require 'rspec'
require 'cashier'
require 'product'
require 'purchase'
require 'products_purchases'
require 'shoulda-matchers'


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Product.all.each {|product| product.destroy}
  end
end
