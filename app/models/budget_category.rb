class BudgetCategory < ActiveRecord::Base
	belongs_to :budget

	def budget_name
		budget = Budget.where(:id => budget_id)
		if budget.length > 0
			budget_name = budget.first.name
		else
			budget_name = ''	
		end
		"#{budget_name}"
	end

end