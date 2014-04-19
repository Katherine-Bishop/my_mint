@MyMint.module "TransactionsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		listTransactionss: ->
			App.request "transaction:entities", (transactions) =>
			
				@layout = @getLayoutView()
			
				@layout.on "show", =>
					@showPanel transactions
					@showTransactions transactions
			
				App.mainRegion.show @layout
		
		showPanel: (transactions) ->
			panelView = @getPanelView transactions
			@layout.panelRegion.show panelView
		
		showTransactions: (transactions) ->
			transactionsView = @getTransactionsView transactions
			@layout.transactionsRegion.show transactionsView
		
		getTransactionsView: (transactions) ->
			new List.Transactions
				collection: transactions
			
		getPanelView: (transactions) ->
			new List.Panel
				collection: transactions
		
		getLayoutView: ->
			new List.Layout