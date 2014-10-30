@MyMint.module "BudgetCategoriesApp", (BudgetCategoriesApp, App, Backbone, Marionette, $, _) ->
	
	class BudgetCategoriesApp.Router extends Marionette.AppRouter
		appRoutes:
			"budget_categories" : "listBudgetCategories"
	
		API =
			listBudgetCategories: ->
				BudgetCategoriesApp.List.Controller.listBudgetCategories()
		
		App.addInitializer ->
			new BudgetCategoriesApp.Router
				controller: API