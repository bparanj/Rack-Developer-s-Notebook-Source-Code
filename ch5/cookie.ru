run lambda {|env| [200, {'Content-Type'=>'text/html',
'Set-Cookie'=>"id = 1234567\nname=jack\nphone=65452334"}, 
 ['I like cookies!']]}