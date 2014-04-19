@MyMint.module "TransactionsApp.List", (List, App, Backbone, Marionette, $, _) ->
	window.app = App;

	class List.Layout extends Marionette.Layout
		template: "transactions/list/templates/list_layout"
		
		regions:
			panelRegion: "#panel-region"
			transactionsRegion: "#transactions-region"
	
	class List.Panel extends Marionette.ItemView
		template: "transactions/list/templates/_panel"
	
	class List.Transaction extends Marionette.ItemView
		template: "transactions/list/templates/_transaction"
		tagName: "tr"
	
	class List.Empty extends Marionette.ItemView
		template: "transactions/list/templates/_empty"
		tagName: "tr"
	
	class List.Transactions extends Marionette.CompositeView
		template: "transactions/list/templates/_transactions"
		itemView: List.Transaction
		emptyView: List.Empty
		itemViewContainer: "tbody"