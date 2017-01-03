#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#encoding 'cgi'
cgi = CGI.new
data = open("bbsdata.txt,a:UTF-8")
data.write(name + ":" + message + "\n")
data.close
print cgi.header("text/html;charset=utf-8")
print <<EOF
<html><body>
<p>書き込みありがとうございます</p>
<a href="bbs.rb">1行掲示板に戻る</a>
</body></html>
EOF
