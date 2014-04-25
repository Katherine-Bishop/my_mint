@MyMint.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.BudgetCategory extends Entities.Model
	
	class Entities.BudgetCategoriesCollection extends Entities.Collection
		model: Entities.BudgetCategory
		url: -> Routes.budget_categories_path()
	
	API =
		setCurrentBudgetCategory: (currentBudgetCategory) ->
			new Entities.BudgetCategory currentBudgetCategory
		
		getBudgetCategoryEntities: (cb) ->
			budget_categories = new Entities.BudgetCategoriesCollection
			budget_categories.fetch
				success: ->
					cb budget_categories
	
	App.reqres.setHandler "set:current:budget_category", (currentBudgetCategory) ->
		API.setCurrentBudgetCategory currentBudgetCategory
	
	App.reqres.setHandler "budget_category:entities", (cb) ->
		API.getBudgetCategoryEntities cb