@MyMint.module "TransactionsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		listTransactions: ->
			transactions = App.request "transaction:entities"

			App.execute "when:fetched", transactions, =>
				@layout = @getLayoutView()
			
				@layout.on "show", =>
					@panelRegion transactions
					@transactionsRegion transactions
			
				App.mainRegion.show @layout	

		panelRegion: (transactions) ->
			that = this
			panelView = @getPanelView transactions
			
			panelView.on "new:transaction:button:clicked", =>
				@newRegion()
			
			@layout.panelRegion.show panelView	
		
		transactionsRegion: (transactions) ->
			transactionsView = @getTransactionsView transactions

			transactionsView.on "itemview:transaction:clicked", (child, transaction) ->
				App.vent.trigger "transaction:clicked", transaction
				
			@layout.transactionsRegion.show transactionsView
		
		getTransactionsView: (transactions) ->
			new List.Transactions
				collection: transactions
			
		getPanelView: (transactions) ->
			new List.Panel
				collection: transactions
		
		getLayoutView: ->
			new List.Layout

		newRegion: ->
			region = @layout.newRegion
			newView = App.request "new:transaction:view"
			newView.on "form:cancel:button:clicked", =>
				region.close()
			region.show	newView