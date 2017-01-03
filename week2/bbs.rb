#!/usr/bin/env ruby
# encoding: utf-8
require "cgi"
cgi=CGI.new
data=open("bbsdata.txt","r:utf-8")
message=CGI.escapeHTML(data.read)
data.close
print cgi.header("text/html; charset=utf-8")
print <<EOF
<html>
<body>
<h1>1行掲示板</h1>
<p>メッセージをどうぞ</p>
<form action="update.rb" method="get">
<div>メッセージ: <input type="text" name="message"></div>
<div>お名前: <input type="text" name="name"></diiv></br>
<input type="submit" value="送信">
<input type="reset" value="クリア">
</br>
</form>
<p>-----------------------------------</p>
<pre>
#{message}
</pre>
</body>
</html>
EOF
