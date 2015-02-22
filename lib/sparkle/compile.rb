require 'coffee-script'
require 'sass'
require 'yaml'

class Compiler
	def initialize()
		@dir = Dir.pwd
		return false unless _validate()
		return false unless _determine()
	end
	
	def _validate()
		status = File.file?( "#{@dir}/project.yml" )
		if status == true
			return true
		else
			puts "Could not find a valid project!"
			return false
		end
	end
	
	def _determine()
		begin
			yaml = File.read( "#{@dir}/project.yml" )
			yaml = YAML.load( yaml )
			if yaml['type'] == 'coffee-script'
				_coffee()
			elsif yaml['type'] == 'sass'
				_sass()
			else
				puts 'Invalid project type!'
			end
		rescue
			puts 'Error while parsing project file!'
			puts 'Please make sure your project file contains valid Yaml.'
			puts $!, $@
			return false
		end
		
		return true
	end
	
	def _coffee()
		buffer = ''
		includes_path = "#{@dir}/includes"
		includes = Dir.entries( includes_path )
		output_file = "#{@dir}/compiled/output.js"
		
		includes.shift
		includes.shift
		
		begin
			includes.each { |include|
				puts "Compiling #{include}..."
				buffer += File.read( includes_path + '/' + include )
				buffer += "\n"
			}
			
			puts "Compiling main.coffee..."
			buffer += File.read( "#{@dir}/main.coffee" )
			buffer = CoffeeScript.compile( buffer )
			
			File.open( output_file, 'w' ) { |file| file.write( buffer ) }
		rescue
			puts 'There was an error while compiling your project.'
			puts $!, $@
		end
	end
	
	def _sass()
		begin
			Sass.compile_file( "#{@dir}/main.scss", css_filename="#{@dir}/compiled/output.css" )
		rescue
			puts 'Error while compiling project.'
			puts $!, $@
		end
	end
end