#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# encording: utf-8
require "cgi"
require "sqlite3"
cgi=CGI.new
print cgi.header("text/html;charset=utf-8")
begin
    db = SQLite3::Database.new("gamedatabase.db")
rescue => ex
    puts "page error"
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
    print <<-EOF
    <a href="playerrb.rb?id=#{row[0]}">#{row[1]}</a></br>
    EOF
  }
}
db.close
print <<-EOF
</body> 
</html>
EOF