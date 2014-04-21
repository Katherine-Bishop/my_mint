@MyMint.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Budget extends Entities.Model
	
	class Entities.BudgetsCollection extends Entities.Collection
		model: Entities.Budget
		url: -> Routes.budgets_path()
	
	API =
		setCurrentBudget: (currentBudget) ->
			new Entities.Budget currentBudget
		
		getBudgetEntities: (cb) ->
			budgets = new Entities.BudgetsCollection
			budgets.fetch
				success: ->
					cb budgets
	
	App.reqres.setHandler "set:current:budget", (currentBudget) ->
		API.setCurrentBudget currentBudget
	
	App.reqres.setHandler "budget:entities", (cb) ->
		API.getBudgetEntities cb