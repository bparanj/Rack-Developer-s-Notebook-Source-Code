require "rubygems" 
require "rack"
require "thin"

cgi_inspector = lambda do |env| 

	[200, {}, ["Your request: 
			http method is #{env['REQUEST_METHOD']}
			path is #{env['PATH_INFO']}
			params is #{env['QUERY_STRING']}
		 "]]
end