@MyMint.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Transaction extends Entities.Model
		urlRoot: -> Routes.transactions_path()
	
	class Entities.TransactionsCollection extends Entities.Collection
		model: Entities.Transaction
		url: -> Routes.transactions_path()
	
	API =
		getTransactionEntities: (cb) ->
			transactions = new Entities.TransactionsCollection
			transactions.fetch
				success: ->
					cb transactions
			transactions	

		getTransaction: (id) ->
			transaction = new Entities.Transaction
				id: id
			transaction.fetch()
			transaction		
	
	App.reqres.setHandler "transaction:entities", (cb) ->
		API.getTransactionEntities cb

	App.reqres.setHandler "transaction:entity", (id) ->
		API.getTransaction id	