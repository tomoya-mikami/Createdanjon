#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# encording: utf-8
require "cgi"
require "sqlite3"
cgi=CGI.new
print cgi.header("text/html;charset=utf-8")
p=//
if cgi["title"]!="" then
  title=cgi["title"].chomp
else
  title="notitleflag"
end
begin
    db = SQLite3::Database.new("gamedatabase.db")
rescue => ex
    puts "page error"
end
if title!="notitleflag" then
  pattern=".*#{title}.*"
  p=Regexp.new(pattern,true)
end
print <<-EOF
<!DOCUTYPE html>
<html>
<head>
</head>
<body>
    <h1>ステージセレクト</h1>
EOF
db.transaction(){
  db.execute("select * from map;"){|row|
    if title!="notitleflag" then
      if p=~row[1] then
        print <<-EOF
    <a href="playerrb.rb?id=#{row[0]}&name=#{row[1]}">#{row[1]}</a></br>
    EOF
      end
    else
      print <<-EOF
    <a href="playerrb.rb?id=#{row[0]}&name=#{row[1]}">#{row[1]}</a></br>
    EOF
    end
  }
}
db.close
print <<-EOF
<form action="index.rb" method=post>
<h3>検索はこちら</h3>
<p>タイトル:<input type="text" name="title"></p>
<input type="submit" values="検索">
</form>
<h3><a href="create.html">ステージ作成はこちら</a></h3>
</body> 
</html>
EOF
