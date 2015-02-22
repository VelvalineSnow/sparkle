require 'yaml'

class Factory
	def initialize( opts )
		@dir = Dir.pwd
		return false unless _check( opts )
	end
	
	def _check( opts )
		if opts[0] == 'js' or opts[0] == 'css'
			if opts[0] == 'js'
				_js( opts[1] )
				return true
			elsif opts[0] == 'css'
				_css( opts[1] )
				return true
			end
		else
			puts 'Invalid project type ' + opts[0]
			puts 'Please see help for more info.'
			return false
		end
	end
	
	def _tree( name )
		begin
			Dir.mkdir( "#{@dir}/#{name}" )
			Dir.mkdir( "#{@dir}/#{name}/compiled" )
			Dir.mkdir( "#{@dir}/#{name}/includes" )
		rescue
			puts 'Error while creating tree!'
			puts $!, $@
			Kernel::abort
		end
	end
	
	def _generate( type, location )
		config = { 'type' => type, 'author' => 'TEST', 'password' => 'TEST', 'version' => '0.0.1' }
		
		begin
			File.open( location, "w+" ) { |f| f.write config.to_yaml }
		rescue
			puts 'Error while creating project file!'
			puts $!, $@
			Kernel::abort
		end
	end
	
	def _js( name )
		_tree( name )
		_generate( 'coffee-script', "#{@dir}/#{name}/project.yml" )
		File.open( "#{@dir}/#{name}/main.coffee", "w+" )
	end
	
	def _css( name )
		_tree( name )
		_generate( 'coffee-script', "#{@dir}/#{name}/project.yml" )
		File.open( "#{@dir}/#{name}/main.scss", "w+" )
	end
end