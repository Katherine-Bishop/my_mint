@MyMint.module "BudgetsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		listBudgets: ->
			App.request "budget:entities", (budgets) =>
			
				@layout = @getLayoutView()
			
				@layout.on "show", =>
					@showPanel budgets
					@showBudgets budgets
			
				App.mainRegion.show @layout
		
		showPanel: (budgets) ->
			panelView = @getPanelView budgets
			@layout.panelRegion.show panelView
		
		showBudgets: (budgets) ->
			budgetsView = @getBudgetsView budgets
			@layout.budgetsRegion.show budgetsView
		
		getBudgetsView: (budgets) ->
			new List.Budgets
				collection: budgets
			
		getPanelView: (budgets) ->
			new List.Panel
				collection: budgets
		
		getLayoutView: ->
			new List.Layout