require 'active_record'
require './lib/product'
require './lib/cashier'
require './lib/purchase'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

# require 'pry'
# binding.pry

def welcome
  puts "Welcome to your POS systen"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Are you a manager, cashier, or customer?"
    puts "Press 'e' to exit."
    choice = gets.chomp.downcase
    case choice
    when 'manager'
      manager_menu
    when 'cashier'
      cashier_menu
    when 'customer'
      customer_menu
    when "e"
      puts "Good-Bye!"
    else
      puts "Not a valid choice."
      menu
    end
  end
end

def manager_menu
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add a product', 'l' to list your products, 'cl' to list purchases by cashier"
    puts "Press 'e' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      add_product
    when 'l'
      list_product
    when 'cl'
      list_cashier
    when 'e'
      puts "Good-bye!"
    else
      puts "Not a valid option, returning back to manager menu."
      manager_menu
    end
  end
end

def add_product
  puts "Who is the cashier?"
  cashier_name = gets.chomp
  puts "What would you like to add?"
  product_name = gets.chomp
  puts "What is the price of #{product_name}?"
  product_price = gets.chomp
  product = Product.new({:name => product_name, :price => product_price})
  product.save
  cashier = Cashier.new({:login_name => cashier_name})
  cashier.save
  puts "#{cashier_name} have added '#{product_name}' that costs '#{product_price}' to the database"
end

def list_product
  puts "Here are all the things you sold"
  products = Product.all
  products.each do
    |product| puts "#{product.name}" + " -- " + '$' + sprintf("%.2f", product.price)
  end
end

welcome
