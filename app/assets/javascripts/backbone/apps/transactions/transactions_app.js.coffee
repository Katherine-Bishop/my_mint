@MyMint.module "TransactionsApp", (TransactionsApp, App, Backbone, Marionette, $, _) ->
	
	class TransactionsApp.Router extends Marionette.AppRouter
		appRoutes:
			"transactions"	: "listTransactions"
	
	API =
		listTransactions: ->
			TransactionsApp.List.Controller.listTransactions()
	
	App.addInitializer ->
		new TransactionsApp.Router
			controller: API