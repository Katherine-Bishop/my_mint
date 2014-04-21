@MyMint.module "BudgetsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "budgets/list/templates/list_layout"
		
		regions:
			panelRegion: "#panel-region"
			budgetsRegion: "#budgets-region"
	
	class List.Panel extends App.Views.ItemView
		template: "budgets/list/templates/_panel"
	
	class List.Budget extends App.Views.ItemView
		template: "budgets/list/templates/_budget"
		tagName: "tr"
	
	class List.Empty extends App.Views.ItemView
		template: "budgets/list/templates/_empty"
		tagName: "tr"
	
	class List.Budgets extends App.Views.CompositeView
		template: "budgets/list/templates/_budgets"
		itemView: List.Budget
		emptyView: List.Empty
		itemViewContainer: "tbody"