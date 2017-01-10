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