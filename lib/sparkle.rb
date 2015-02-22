require_relative File.dirname(__FILE__) + '/sparkle/compile'
require_relative File.dirname(__FILE__) + '/sparkle/new'
#require_relative File.dirname(__FILE__) + 'sparkle/push'

class Sparkle
	def initialize( args )
		@version = '0.0.1'
		return unless _check( args )
	end
	
	def _check( args )
		valid = { 'compile' => 0, 'help' => 0, '-h' => 0, 'new' => 2, 'push' => 0, 'version' => 0, '-v' => 0 }
		if valid[args[0]] then
			if args.size - 1 == valid[args[0]]
				if args[0] == 'compile'
					return _compile()
				elsif args[0] == 'help' or args[0] == '-h'
					return _help()
				elsif args[0] == 'new'
					return _new( [args[1], args[2]] )
				elsif args[0] == 'push'
					return _push()
				elsif args[0] == 'version' or args[0] == '-v'
					return _version()
				end
			else
				puts "Invalid number of arguments: #{args.size}!"
				return false
			end
		else
			puts "Invalid argument #{args[0]}"
			return false
		end
	end
	
	def _compile()
		return Compiler.new()
	end
	
	def _help()
		puts <<EOF
USEAGE: sparkle [ACTION] [PARAMETERS]

FLAGS:
        help [-h]                  Displays this dialogue
        version [-v]               Displays the current sparkle version

COMANDS:
        compile                    Compiles current project
        new [js|css] [name]        Creates a new project (CoffeeScript/JavaScript or CSS/SCSS)
        push                       Push current project to Wikia Developers Wiki
EOF
	end
	
	def _new( opts )
		return Factory.new( opts )
	end
	
	def _push()
		puts 'push'
	#	return Manager.push()
	end
	
	def _version()
		puts 'Sparkle version ' + @version
	end
end