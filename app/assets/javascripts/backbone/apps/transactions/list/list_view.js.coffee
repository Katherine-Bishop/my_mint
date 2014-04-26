@MyMint.module "TransactionsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "transactions/list/templates/list_layout"
		
		regions:
			panelRegion: "#panel-region"
			transactionsRegion: "#transactions-region"
	
	class List.Panel extends App.Views.ItemView
		template: "transactions/list/templates/_panel"
	
	class List.Transaction extends App.Views.ItemView
		template: "transactions/list/templates/_transaction"
		tagName: "tr"
	
	class List.Empty extends App.Views.ItemView
		template: "transactions/list/templates/_empty"
		tagName: "tr"
	
	class List.Transactions extends App.Views.CompositeView
		template: "transactions/list/templates/_transactions"
		events: 
			'keydown': 'filterColumn',
			'click [data-action=clear-filter]': 'clearFilter'
		filterColumn: (event)->
			if event.keyCode == 13
				window.event = event
				input = @$('input:focus')
				search = input.val()
				inputClass = input.parent().attr('class')
				window.input = input
				@$('td.'+inputClass+':not(:contains("' + search + '"))').parent().hide()
		clearFilter: (event)->
			@$('tr').show()
		itemView: List.Transaction
		emptyView: List.Empty
		itemViewContainer: "tbody"