@MyMint.module "TransactionsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
	
	Edit.Controller = 

		edit: (id, transaction) ->
			transaction or= App.request "transaction:entity", id

			App.execute "when:fetched", [transaction], =>
				editView = @getEditView transaction

				App.mainRegion.show editView

		getEditView: (transaction) ->
			new Edit.Transaction
				model: transaction

	App.commands.setHandler "when:fetched", (entities, callback) ->

		xhrs = _.chain([entities]).flatten().pluck("_fetch").value()
			
		$.when(xhrs...).done ->
			callback()