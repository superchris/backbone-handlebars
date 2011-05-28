module BackboneHandlebars
  module RenderTemplatesHelper
    def render_backbone_template(template)
      raw File.read(::Rails.root.join "app", "assets", "templates", "#{template}.handlebars.html")
    end
    
    def render_backbone_templates
      template_directory = ::Rails.root.join "app", "assets", "templates", "*.handlebars.html"
      templates = Dir.glob(template_directory).collect { |t| File.read t }
      raw templates.join("\n")
    end
  end
end