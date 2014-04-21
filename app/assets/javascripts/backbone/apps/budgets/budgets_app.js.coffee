@MyMint.module "BudgetsApp", (BudgetsApp, App, Backbone, Marionette, $, _) ->
	
	class BudgetsApp.Router extends Marionette.AppRouter
		appRoutes:
			"budgets" : "listBudgets"
	
		API =
			listBudgets: ->
				BudgetsApp.List.Controller.listBudgets()
		
		App.addInitializer ->
			new BudgetsApp.Router
				controller: API