class TransactionsController < ApplicationController
	respond_to :json
	def index
		@transactions = Transaction.all
		@budgets = Budget.all
		@budget_names = ['foobar'];
		@budgets.each do |budget|
			@budget_names[budget.id] = budget.name
		end	
	end

	def import
	   	begin
	         Transaction.import(params[:file].tempfile)
	         redirect_to root_url, notice: "Transactions imported."
	    rescue
	         redirect_to root_url, notice: "Invalid CSV file format."
	    end
	end

	def new
		@transaction = Transaction.new
	end	

	def create
		@transaction = Transaction.new(params[:transaction].permit(:description, :date, :amount, :category, :account_name, :budget_id))
		
		if @transaction.save
			redirect_to action: "index"
			flash[:notice] = "Transaction successfully saved"
		else
			redirect_to action: "create"
			flash[:notice] = "Transaction not saved"	
		end	
	end	

	def edit
		@transaction = Transaction.find(params[:id])
	end
	
	def update
		@transaction = Transaction.find(params[:id])
		if @transaction.update(params[:transaction].permit(:description, :date, :amount, :category, :account_name, :budget_id))
			redirect_to transactions_path
			flash[:notice] = 'Transaction was successfully edited.'
		else
			render 'edit'	
			flash[:notice] = 'Transaction was NOT successfully edited.'
		end	
	end	

	def destroy
		@transaction = Transaction.find(params[:id])
		@transaction.destroy
		redirect_to transactions_path
	end
end
