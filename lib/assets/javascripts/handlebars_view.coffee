#= require handlebars
class HandlebarsView extends Backbone.View
  constructor: (options = {})->
    @el = $("##{@name}") unless options.el
    @subViews = []
    @parent = options.parent
    super
    templateEl = $("##{@name}_template")
    console.log "Did you include the template for #{@name}, putz?" if console? && templateEl.size() == 0
    @template = if templateEl.size() > 0 then Handlebars.compile(templateEl.html(), true) else -> ""

  templateContext: ->
    @model.attributes

  render: ->
    @subViews = []
    @el.html @template @templateContext(), Handlebars.helpers, Handlebars.partials, {view: this}
    @renderSubView(subView) for subView in @subViews
  
  findEl: ->
    @el = $("[data-guid='#{@model.get("guid")}']")
    
  renderSubView: (subView) ->
    subView.findEl()
    subView.delegateEvents()
    subView.render()  
