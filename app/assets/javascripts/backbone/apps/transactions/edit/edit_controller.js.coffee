@MyMint.module "TransactionsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
	
	Edit.Controller = 

		edit: (id, transaction) ->
			transaction or= App.request "transaction:entity", id

			App.execute "when:fetched", transaction, =>
				@layout = @getLayoutView transaction

				@layout.on "show", =>
					@formRegion transaction

				App.mainRegion.show @layout

		formRegion: (transaction) ->
			editView = @getEditView transaction

			formView = App.request "form:wrapper", editView

			@layout.formRegion.show formView

		getLayoutView: (transaction) ->
			new Edit.Layout
				model: transaction

		getEditView: (transaction) ->
			new Edit.Transaction
				model: transaction