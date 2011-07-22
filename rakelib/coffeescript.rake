namespace :coffeescript do
  
  def compile_files(files, output_dir)
    require 'coffee-script'
    files.each do |f|
      new_f = File.join(output_dir, f.pathmap("%n").match(/^([^.]+)/).to_s + ".js")
      File.open(new_f, "w") do |out|
        puts "compiling #{f} to #{new_f}"
        out.puts CoffeeScript.compile File.read(f)
      end
    end    
  end
  
  namespace :compile do
    desc "re-compile the coffeescript into javascript"
    task :assets do
      coffee_files = FileList["lib/assets/javascripts/*.coffee" ]
      mkdir_p "javascripts/compiled"
      compile_files(coffee_files, "javascripts/compiled")
    end
    
    desc "re-compile the spec coffeescript into javascript"
    task :specs do
      mkdir_p "spec/javascripts/compiled"
      compile_files(FileList["spec/javascripts/*.coffee"], "spec/javascripts/compiled")
    end
  end
  
  task :compile => ["compile:assets", "compile:specs"]
end