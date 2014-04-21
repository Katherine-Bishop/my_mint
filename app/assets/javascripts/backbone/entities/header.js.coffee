@MyMint.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Header extends Entities.Model
	
	class Entities.HeaderCollection extends Entities.Collection
		model: Entities.Header

	
	API =
		getHeaders: ->
			new Entities.HeaderCollection [
				{ name: "Transactions", url: Routes.transactions_path() }
				{ name: "Budgets", url: Routes.budgets_path() }
			]
	window.app = App
	App.reqres.setHandler "header:entities", ->
		API.getHeaders()