class CreateCashier < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.column :login_name, :string

      t.timestamps
    end
  end
end
