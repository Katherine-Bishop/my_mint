class Transaction < ActiveRecord::Base
	has_one :budget

	# validates_presence_of :description
	validates_presence_of :date, :unless => proc { new_record? }
	
	def self.import(file)
	  	CSV.foreach(file, headers: true) do |row|
	  		#skips credit card payments
	  		next if row[5] == 'Credit Card Payment'
	  		#converts credits to negative numbers
	  		if row[4] == 'credit'
	  			row[3] = '-'+row[3]
	  		end	
	  		#converts date from month/day/year format
	  		row[0] = row[0].nil? ? nil : DateTime.strptime(row[0], "%m/%d/%Y").strftime("%Y/%m/%d")
	  		if row[6] == 'Southwest Card'
	  			row[3] = (row[3].to_f/2).round(2)
	  		end	
	  		#if a budget with the category name exists, add the budget id to this
	  		#transaction
	  		budget_category = BudgetCategory.where(:category => row[5])
	  		if budget_category.length > 0
	  			row[7] = budget_category[0][:budget_id]
	  		elsif row[5] == 'Uncategorized'
	  			row[7] = nil
	  		else
	  			misc_budget = Budget.where(:name => 'Misc')
	  			logger.debug "Misc budget id: #{misc_budget}"
	  			row[7] = misc_budget[0][:id]
	  		end		
	    	# Transaction.create! row.to_hash

	    	Transaction.create(
	    		:date => row[0],
			    :description => row[1],
			    :original_decription => row[2],
			    :amount => row[3],
			    :transaction_type => row[4],
			    :category => row[5],
			    :account_name => row[6],
			    :budget_id => row[7]
    			)
	  	end
	end

	def budget_name
		budget = Budget.where(:id => budget_id)
		if budget.length > 0
			budget_name = budget.first.name
		else
			budget_name = ''	
		end
		logger.debug "Budget name is: #{budget_name}"
		"#{budget_name}"
	end
end
