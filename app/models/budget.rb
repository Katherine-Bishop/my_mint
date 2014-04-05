class Budget < ActiveRecord::Base
	def budget_utilized
	    budget_utilized = 0
	    transactions = Transaction.where(:category => name )
	    transactions.each do |transaction|
	    	budget_utilized += transaction.amount
	    end	
	    return budget_utilized
  	end
end
