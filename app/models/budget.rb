class Budget < ActiveRecord::Base
	has_many :transactions
	has_many :budget_categories
	def budget_utilized
	    budget_utilized = 0
	    transactions = Transaction.where(:budget_id => id)
	    transactions.each do |transaction|
	    	budget_utilized += transaction.amount
	    end	
	    return budget_utilized
  	end

  	def categories
  		categories = []
  		budget_categories = BudgetCategory.where(:budget_id => id)
  		budget_categories.each do |budget_category|
  			categories.push(budget_category.category)
  		end
  		return categories
  	end	
end
