#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#encodring 'cgi'
require 'cgi'
require 'sqlite3'
cgi=CGI.new
print cgi.header("text/html;charset=UTF-8")
data=Hash.new(0)
num=0

print <<EOF
<!DOCTYPE html>
<html>
<body>
EOF

begin
io_q=open("question.txt","r:utf-8")
db = SQLite3::Database.new("report1102.db")
rescue => ex
  print <<EOF
読み込みに失敗しました。お手数ですがもう一度ページを読み込むか時間を開けてアクセスして下さい<br>
<a href="enquete_form2.rb">投票に戻る</a>
</body>
</html>
EOF
#さすがにerror_log.txtの判定をすると無限ループになるからやらない
io_log=open("error_log.txt","a:utf-8")
io_log.write("#{ex}\n")
io_log.close
exit
end

#タイトルの話
title=io_q.gets
#問題の読み込み
while line=io_q.gets
  line=line.chomp
  data[line]=0
end
#投票数の読み込み
db.transaction(){
  db.execute("select * from votes;"){|row|
    data[row[0]]+=1
    num+=1
  }
}

io_q.close
db.close
#htmlの生成
print <<EOF
<h1>投票結果</h1>
<h2>#{title}</h2>
投票数 : #{num}<br>
EOF

data.each{|key,value|
  print "  ・#{key} : #{value}<br>"
}

print <<EOF
<a href="enquete_form2.rb">投票に戻る</a>
</body>
</html>
EOF
