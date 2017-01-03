#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#encording: utf-8
require 'cgi'
require 'sqlite3'
cgi=CGI.new
print cgi.header("text/html;charset=utf-8")
#フォームのデータの受け取り
vote=cgi.params["vote"]

print <<EOF
<!DOCTYPE html>
<html>
<body>
EOF

if vote.empty?
print <<EOF
投票はチェックボックスをクリックして下さい</br>
<a href="enquete_form.rb">投票に戻る</a>
EOF
else
#データベースの読み取り
begin
  db = SQLite3::Database.new("report1102.db")
rescue => ex
  print <<EOF
読み込みに失敗しました</br>
<a href="enquete_form.rb">投票に戻る</a>
</body>
</html>
EOF
#さすがにerror_log.txtの判定をすると無限ループになるからやらない
io_log=open("error_log.txt","a:utf-8")
io_log.write("#{ex}\n")
io_log.close
  exit
end
vote.each{|res|
  db.transaction(){
    db.execute("insert into votes values('#{res}');")
  }
}

print <<EOF
投票ありがとうございました</br>
<a href="enquete_form2.rb">投票に戻る</a>
<a href="view_result2.rb">投票結果はこちら</a>
</body>
</html>
EOF
end
