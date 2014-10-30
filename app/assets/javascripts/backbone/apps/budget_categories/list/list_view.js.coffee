@MyMint.module "BudgetCategoriesApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "budget_categories/list/templates/list_layout"
		
		regions:
			panelRegion: "#panel-region"
			budgetCategoriesRegion: "#budget-categories-region"
	
	class List.Panel extends App.Views.ItemView
		template: "budget_categories/list/templates/_panel"
	
	class List.BudgetCategory extends App.Views.ItemView
		template: "budget_categories/list/templates/_budget_category"
		tagName: "div"
	
	class List.Empty extends App.Views.ItemView
		template: "budget_categories/list/templates/_empty"
		tagName: "tr"
	
	class List.BudgetCategories extends App.Views.CompositeView
		template: "budget_categories/list/templates/_budget_categories"
		itemView: List.BudgetCategory
		emptyView: List.Empty
		itemViewContainer: "div"