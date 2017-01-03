#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#encoding 'cgi'
require 'cgi'
cgi = CGI.new
name=cgi["name"]
message=cgi["message"]
data = open("bbsdata.txt","a:UTF-8")
data.write(name + ":" + message + "\n")
data.close
print cgi.header("text/html;charset=utf-8")
print <<EOF
<html><body>
<p>書き込みありがとうございます</p>
<a href="bbs_js.rb">1行掲示板に戻る</a>
</body></html>
EOF
