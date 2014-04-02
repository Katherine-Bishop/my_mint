class BudgetsController < ApplicationController
		def index
			@budgets = Budget.all
		end	
		
		def new
			@budget = Budget.new
		end	

		def create
			@budget = Budget.new(params[:budget].permit(:name, :amount))
			
			if @budget.save
				redirect_to action: "index"
				flash[:notice] = "Budget successfully saved"
			else
				redirect_to action: "create"
				flash[:notice] = "Budget not saved"	
			end	
		end	

		def edit
			@budget = Budget.find(params[:id])
		end
		
		def update
			@budget = Budget.find(params[:id])
			if @budget.update(params[:budget].permit(:name, :amount))
				redirect_to budgets_path
				flash[:notice] = 'Budget was successfully edited.'
			else
				render 'edit'	
				flash[:notice] = 'Budget was NOT successfully edited.'
			end	
		end	

		def show
			@budget = Budget.find(params[:id])
		end	

		def destroy
			@budget = Budget.find(params[:id])
			@budget.destroy
			redirect_to budgets_path
		end	
end
