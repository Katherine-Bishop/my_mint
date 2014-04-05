class Transaction < ActiveRecord::Base
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
	    	Transaction.create! row.to_hash
	  	end
	end
end
