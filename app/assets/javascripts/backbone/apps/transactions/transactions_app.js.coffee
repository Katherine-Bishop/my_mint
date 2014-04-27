@MyMint.module "TransactionsApp", (TransactionsApp, App, Backbone, Marionette, $, _) ->
	
	class TransactionsApp.Router extends Marionette.AppRouter
		appRoutes:
			"transactions"	: "listTransactions"
	
	API =
		listTransactions: ->
			TransactionsApp.List.Controller.listTransactions()

		newTransaction: ->
			TransactionsApp.New.Controller.newTransaction()

		edit: (transaction) ->
			TransactionsApp.Edit.Controller.edit transaction

	App.reqres.setHandler "new:transaction:view", ->
		API.newTransaction()

	App.vent.on "transaction:clicked", (transaction) ->
		API.edit transaction			
	
	App.addInitializer ->
		new TransactionsApp.Router
			controller: API