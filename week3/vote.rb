#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#encording: utf-8
require 'cgi'
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
#ファイルの読み取り
begin
  io = open("vote_result.txt","a:UTF-8")
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
io.flock(File::LOCK_EX)
  vote.each{|data_v|
    io.write(data_v+"\n")
  }
io.flock(File::LOCK_UN)
  io.close

print <<EOF
投票ありがとうございました</br>
<a href="enquete_form.rb">投票に戻る</a>
<a href="view_result.rb">投票結果はこちら</a>
</body>
</html>
EOF
end
