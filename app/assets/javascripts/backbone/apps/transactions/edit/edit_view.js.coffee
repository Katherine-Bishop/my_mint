@MyMint.module "TransactionsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
	
	class Edit.Layout extends App.Views.Layout
		template: "transactions/edit/templates/edit_layout"
		
		regions:
			titleRegion:	"#title-region"
			formRegion: 	"#form-region"
	
	class Edit.Title extends App.Views.ItemView
		template: "transactions/edit/edit_title"
		
		modelEvents:
			"updated" : "render"
	
	class Edit.Transaction extends App.Views.ItemView
		template: "transactions/edit/templates/edit_transaction"

		form:
			footer: false
			focusFirstInput: true

		modelEvents:
			"sync" : "render"
		# 
		# onFormSubmit: (data) ->
		# 	console.log "Edit.Transaction onFormSubmit", data
		# 	false