require 'sinatra/base'
#require 'rack/utils'

module Sinatra
	module Helpers
		module Html
			module Escape
				
				ESCAPE_HTML = {
					'&'  => '&amp;',
					'<'  => '&lt;',
					'>'  => '&gt;',
				#	'\'' => '&#x27;',
					'\'' => '&#39;',
					'"'  => '&quot;',
				}
				ESCAPE_HTML_PATTERN = ::Regexp.union( *ESCAPE_HTML.keys )
				
				def h( str )
					#::Rack::Utils.escape_html( str )
					str.to_s.gsub( ESCAPE_HTML_PATTERN ){ |c| ESCAPE_HTML[c] }
				end
				
			end
		end
	end
	
	#helpers Helpers::Html::Escape
	#::Sinatra::Base.helpers Helpers::Html::Escape
end

