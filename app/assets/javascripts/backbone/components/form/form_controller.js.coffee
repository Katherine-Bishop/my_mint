@MyMint.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	class Form.Controller extends Marionette.Controller

		initialize: (options = {}) ->
			@contentView = options.view

			@formLayout = @getFormLayoutView options.config

			@listenTo @formLayout, "show", @formContentRegion
			@listenTo @formLayout, "close", @close
			@listenTo @formLayout, "form:submit", @formSubmit

		formSubmit: ->
			data = Backbone.Syphon.serialize @formLayout
			if @contentView.triggerMethod("form:submit", data) isnt false
				model = @contentView.model
				collection = @contentView.collection
				@processFormSubmit data, model, collection

		processFormSubmit: (data, model, collection) ->
			model.save data,
				collection

		formContentRegion: ->
			@formLayout.formContentRegion.show @contentView		

		getFormLayoutView: (options = {}) ->
			config = @getDefaultConfig _.result(@contentView, "form")
			_.extend config, options	

			new Form.FormWrapper
				config: config
				model: @contentView.model

		getDefaultConfig: (config = {}) ->
			_.defaults config,
				footer: true
				focusFirstInput: true
				buttons: true

	App.reqres.setHandler "form:wrapper", (contentView, options = {}) ->
		throw new Error "No model found inside of form's contentView" unless contentView.model
		formController = new Form.Controller
			view: contentView
			config: options
		formController.formLayout