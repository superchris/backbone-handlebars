backbone-handlebars
===================

This gem is extracted out of a backbone project where we are using handlebars
templates. It contains:

* handlebars.js
* A HandlebarsView superclass
* a rails helper module for rendering all your handlebars templates into your rails view

Usage
=====

This gem is designed to integrate with the asset pipeline of rails 3.1+.  Somewhere in your 
coffeescript or javascript code you'll need to require it:

    #= require handlebars_view
    
This will bring in handlebars and the view superclass.  To use it, write a view like so:

    class FooView extends HandlebarsView
    
      name: "foo_view"
      
This will cause the view to look for a template in an element with id "foo_view_template" and use 
handlebars to render this view, passing in the attributes of this view's model as the template 
context.  You can change this by overriding the templateContext function in your view.

RenderTemplatesHelper
======================

We've found it best practice to keep our handlebars templates  in separate files so our rails 
views don't get all noisy.  This all let's use the same HandleBars view on more than one rails 
view and in our jasmine specs.  This gem also includes a rails helper module RenderTemplatesHelper.
Best to just look at the code to see what it does for now, it's super simple.