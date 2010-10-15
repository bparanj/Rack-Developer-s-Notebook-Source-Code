map '/hello' do
  run lambda {|env| [200, {"Content-Type" => "text/html"},
    ["SCRIPT_NAME=#{env['SCRIPT_NAME']}", "PATH_INFO=#{env['PATH_INFO']}"]]
    }
end

map '/world' do
  run lambda {|env| [200, {"Content-Type" => "text/html"}, ["world"]]}
end
  