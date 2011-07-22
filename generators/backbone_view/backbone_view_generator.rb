class BackboneViewGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|
      m.template "view.coffee.erb", "backbone/views/#{name}.coffee", :assigns => {:name => name}
      m.template "view_template.html.handlebars", "backbone/templates/#{name}.html.handlebars", :assigns => {:name => name}
    end
  end
end