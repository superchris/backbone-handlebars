
class SimpleView extends Backbone.HandlebarsView
  name: "simple_view"

class window.ParentView extends Backbone.HandlebarsView
  name: "parent_view"
  
class window.ChildView extends Backbone.HandlebarsView
  name: "child_view"
  findEl: -> @el = $("#child")
  
describe "SimpleView", ->
  beforeEach ->
    setFixtures "<div id='simple_view'></div>"
    loadTemplate "simple_view.handlebars.html"
    @simpleView = new SimpleView(model: {})
    @simpleView.render()
  it "finds it's el", ->
    expect(@simpleView.el).toExist()
    
describe "subviews", ->
  beforeEach ->
    setFixtures "<div id='parent_view'></div>"
    loadTemplate "parent_view.handlebars.html"
    loadTemplate "child_view.handlebars.html"
    @parentView = new ParentView(model: {attributes: {}})
    @parentView.render()
  it "renders the child template too", ->
    expect(@parentView.el.html()).toMatch /Foo/
  it "has a child view as a subviews", ->
    expect(@parentView.subViews.length).toEqual(1)