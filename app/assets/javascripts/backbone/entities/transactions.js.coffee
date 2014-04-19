@MyMint.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Transaction extends Entities.Model
	
	class Entities.TransactionsCollection extends Entities.Collection
		model: Entities.Transaction
		url: -> Routes.transactions_path()
	
	API =
		setCurrentTransaction: (currentTransaction) ->
			new Entities.Transaction currentTransaction
		
		getTransactionEntities: (cb) ->
			transactions = new Entities.TransactionsCollection
			transactions.fetch
				success: ->
					cb transactions
	
	App.reqres.setHandler "set:current:transaction", (currentTransaction) ->
		API.setCurrentTransaction currentTransaction
	
	App.reqres.setHandler "transaction:entities", (cb) ->
		API.getTransactionEntities cb