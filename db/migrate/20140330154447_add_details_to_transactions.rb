class AddDetailsToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :date, :date
    add_column :transactions, :description, :string
    add_column :transactions, :original_decription, :string
    add_column :transactions, :amount, :decimal
    add_column :transactions, :transaction_type, :string
    add_column :transactions, :category, :string
    add_column :transactions, :account_name, :string
  end
end
