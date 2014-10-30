@MyMint.module "BudgetCategoriesApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		listBudgetCategories: ->
			App.request "budget:entities", (budgets) =>
				@layout = @getLayoutView()
			
				@layout.on "show", =>
					@showPanel budgets
					@showBudgetCategories budgets

				App.mainRegion.show @layout		
		
		showPanel: (budgetCategories) ->
			panelView = @getPanelView budgetCategories
			@layout.panelRegion.show panelView
		
		showBudgetCategories: (budgetCategories) ->
			budgetCategoriesView = @getBudgetCategoriesView budgetCategories
			@layout.budgetCategoriesRegion.show budgetCategoriesView
		
		getBudgetCategoriesView: (budgetCategories) ->
			new List.BudgetCategories
				collection: budgetCategories
			
		getPanelView: (budgetCategories) ->
			new List.Panel
				collection: budgetCategories
		
		getLayoutView: ->
			new List.Layout