class CreateCustomer < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.column :total_price, :integer

      t.timestamps
    end
  end
end
