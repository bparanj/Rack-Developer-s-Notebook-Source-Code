run lambda {|env| [200, {'Content-Type'=>'text/html',
'Set-Cookie'=>"id = 1234567;domain=example.com"}, ['hello world!']]}