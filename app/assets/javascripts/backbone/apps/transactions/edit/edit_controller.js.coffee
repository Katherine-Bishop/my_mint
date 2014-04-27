@MyMint.module "TransactionsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
	
	Edit.Controller = 

		edit: (transaction) ->
			editView = @getEditView transaction

			App.mainRegion.show editView

		getEditView: (transaction) ->
			new Edit.Transaction
				model: transaction	