#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# encording: utf-8
require "cgi"
cgi=CGI.new
print cgi.header("text/html;charset=utf-8")

print <<EOF
<!DOCTYPE html>
<html>
<body>
EOF

#ファイル読み込み時の例外処理
begin
io=open("question.txt","r:UTF-8")
rescue => ex
print <<EOF
読み込みに失敗しました。お手数ですがもう一度ページを読み込むか時間を開けてアクセスして下さい
</body>
</html>
EOF
#さすがにerror_log.txtの判定をすると無限ループになるからやらない
io_log=open("error_log.txt","a:utf-8")
io_log.write("#{ex}\n")
io_log.close
exit
exit
end

#タイトルの読み込み
title=io.gets

#body生成
print <<EOF
<h1>投票システム</h1>
<h2>#{title}</h2>
<form method="post" action="vote.rb">
EOF

while line=io.gets
  print <<EOF
<input type="checkbox" name="vote" value=#{line}>#{line}</br>
EOF
end

print <<EOF
<br>
<input type="submit" value="送信">
<input type="reset" value="クリア"><br><br>
</form>
<a href="view_result.rb">投票結果はこちら</a>
</body>
</html>
EOF
