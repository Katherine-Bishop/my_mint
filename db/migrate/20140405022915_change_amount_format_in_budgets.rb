class ChangeAmountFormatInBudgets < ActiveRecord::Migration
  def up
   change_column :budgets, :amount, :integer
  end

  def down
   change_column :budgets, :amount, :decimal
  end
end
