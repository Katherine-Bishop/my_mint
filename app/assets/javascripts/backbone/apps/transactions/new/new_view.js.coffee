@MyMint.module "TransactionsApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	class New.Transaction extends App.Views.ItemView
		template: "transactions/new/templates/new_transaction"

		triggers:
			"click [data-form-button='cancel']" : "form:cancel:button:clicked"
		
		form:
			buttons:
				placement: "left"