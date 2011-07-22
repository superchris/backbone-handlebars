class HandlebarsHelpers
  
  is: (block) ->
    hash = block.hash
    block() if this[hash.property] == hash.value
    
  stripe: (collection, block) ->
    item_contents = for index in [0...collection.length]
      collection[index].stripeClass = if ((index % 2) == 0) then "even" else "odd"
      block collection[index]
    item_contents.join("\n")
  
  formatNumber: (number) ->
    $.formatNumber number, {format: "#,###"}
    
  formatCurrency: (number) ->
    $.formatNumber number, {format: "$#,###.00"}
  
  formatPercentage: (number) ->
    formatted = $.formatNumber number, {format: "#,###.0000"}
    "#{formatted}%"
    
  
  helperMissing: -> ""

  view: (block) ->
    params = block.hash
    view = block.data.view
    viewClass = eval(params.viewClass)
    if params.modelClass
      modelClass = eval(params.modelClass)
      model = new modelClass(this)
    else
      model = this
    childView = new viewClass(model: model, parent: view)
    view.subViews.push childView
    block(model)
    
  @registerHelpers: ->
    helpers = new HandlebarsHelpers()
    Handlebars.registerHelper name, helper for name, helper of helpers

$ ->
  HandlebarsHelpers.registerHelpers()