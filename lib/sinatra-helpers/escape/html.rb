require 'sinatra/base'
#require 'rack/utils'

# see Sinatra
module Sinatra
	# see Sinatra
	module Helpers
		
		# Escaping helpers.
		module Escape
			
			# HTML escaping helpers.
			#
			# Usage:
			#
			# Include the module in your Sinatra application:
			#
			#   helpers ::Sinatra::Helpers::Escape::HTML
			#
			module HTML
				
				# Map special characters to HTML entities.
				ESCAPE_HTML = {
					'&'  .freeze => '&amp;',
					'<'  .freeze => '&lt;',
					'>'  .freeze => '&gt;',
				#	'\'' .freeze => '&#x27;',
					'\'' .freeze => '&#39;',
					'"'  .freeze => '&quot;',
				}
				
				# Regexp search pattern for special characters.
				ESCAPE_HTML_PATTERN = ::Regexp.union( *ESCAPE_HTML.keys )
				
				# Escapes the string so it's safe to use in HTML.
				#
				# @param   str      [String]   The string to escape.
				# @return           [String]   Escaped version of the string.
				#
				def h( str )
					#::Rack::Utils.escape_html( str )
					str.to_s.gsub( ESCAPE_HTML_PATTERN ){ |c| ESCAPE_HTML[c] }
				end
				
				extend self  # make instance methods available as class methods
			end
			
			# XML escaping helpers.
			#
			# Usage:
			#
			# Include the module in your Sinatra application:
			#
			#   helpers ::Sinatra::Helpers::Escape::XML
			#
			module XML
				
				# Escapes the string so it's safe to use in XML.
				#
				# @param   str      [String]   The string to escape.
				# @return           [String]   Escaped version of the string.
				#
				def x( str )
					::Sinatra::Helpers::Escape::HTML.h( str )
				end
				
				extend self  # make instance methods available as class methods
			end
			
		end
	end
	
	#helpers Helpers::Escape::HTML
	#::Sinatra::Base.helpers Helpers::Escape::HTML
end

