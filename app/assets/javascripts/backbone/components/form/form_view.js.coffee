@MyMint.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	class Form.FormWrapper extends App.Views.Layout
		template: "form/form"

		tagName: "form"
		attributes: ->
			"data-type": @getFormDataType()

		regions:
			formContentRegion: "#form-content-region"	

		initialize: ->
			@setInstancePropertiesFor "config", "buttons"	

		serializeData: ->
			footer: @config.footer		

		onShow: ->
			_.defer =>
				@focusFirstInput() if @config.focusFirstInput

		focusFirstInput: ->
			@$(":input:visible:enabled:first").focus()

		getFormDataType: ->
			if @model.isNew() then "new" else "edit"	