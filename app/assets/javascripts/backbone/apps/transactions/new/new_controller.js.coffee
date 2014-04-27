@MyMint.module "TransactionsApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	New.Controller =
		
		initialize: ->
			transaction = App.request "new:transaction:entity"
			
			@listenTo transaction, "created", ->
				App.vent.trigger "transaction:created", transaction
			
			newView = @getNewView transaction
			formView = App.request "form:wrapper", newView
			
			@listenTo newView, "form:cancel", =>
				@region.close()
			
			@show formView
		
		newTransaction: ->
			newView = @getNewView()

			newView

		getNewView: ->
			new New.Transaction