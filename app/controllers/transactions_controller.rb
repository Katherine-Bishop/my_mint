class TransactionsController < ApplicationController
	def index
		@transactions = Transaction.all
	end

	def import
	   	begin
	         Transaction.import(params[:file].tempfile)
	         redirect_to root_url, notice: "Transactions imported."
	    rescue
	         redirect_to root_url, notice: "Invalid CSV file format."
	    end
	end
end
