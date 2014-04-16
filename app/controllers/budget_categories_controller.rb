class BudgetCategoriesController < ApplicationController
		def index
			@budgets = Budget.all
			@budget_categories = BudgetCategory.all
		end	
		
		def new
			@budget_category = BudgetCategory.new
		end	

		def create
			@budget_category = BudgetCategory.new(params[:budget_category].permit(:budget_id, :category))
			
			if @budget_category.save
				redirect_to action: "index"
				flash[:notice] = "Budget category successfully saved"
			else
				redirect_to action: "create"
				flash[:notice] = "Budget category not saved"	
			end	
		end	

		def edit
			@budget_category = BudgetCategory.find(params[:id])
		end
		
		def update
			@budget_category = BudgetCategory.find(params[:id])
			if @budget_category.update(params[:budget_category].permit(:budget_id, :category))
				redirect_to budget_categories_path
				flash[:notice] = 'Budget was successfully edited.'
			else
				render 'edit'	
				flash[:notice] = 'Budget was NOT successfully edited.'
			end	
		end	

		def destroy
			@budget_category = BudgetCategory.find(params[:id])
			@budget_category.destroy
			redirect_to budget_categories_path
		end	
end
