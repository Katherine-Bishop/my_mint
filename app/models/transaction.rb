class Transaction < ActiveRecord::Base
	def self.import(file)
	  	CSV.foreach(file, headers: true) do |row|
	    	Transaction.create! row.to_hash
	  	end
	end
end
