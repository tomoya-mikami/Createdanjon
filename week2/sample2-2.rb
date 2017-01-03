#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# encording: utf-8
require 'cgi'
cgi=CGI.new
name=cgi["family"]+cgi["given"]
print cgi.header("text/html;charset=utf-8")
print <<EOF
<html><body>
<p>入力された名前は#{name}です。</p>
</body></html>
EOF
