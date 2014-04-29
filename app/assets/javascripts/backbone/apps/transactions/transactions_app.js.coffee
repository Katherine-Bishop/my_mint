@MyMint.module "TransactionsApp", (TransactionsApp, App, Backbone, Marionette, $, _) ->
	
	class TransactionsApp.Router extends Marionette.AppRouter
		appRoutes:
			"transactions/:id/edit" : "edit"
			"transactions"	: "listTransactions"
	
	API =
		listTransactions: ->
			TransactionsApp.List.Controller.listTransactions()

		newTransaction: ->
			TransactionsApp.New.Controller.newTransaction()

		edit: (id, transaction) ->
			TransactionsApp.Edit.Controller.edit id, transaction

	App.reqres.setHandler "new:transaction:view", ->
		API.newTransaction()

	App.vent.on "transaction:clicked", (transaction) ->
		App.navigate Routes.edit_transaction_path(transaction.id)
		API.edit transaction.id, transaction			
	
	App.addInitializer ->
		new TransactionsApp.Router
			controller: API