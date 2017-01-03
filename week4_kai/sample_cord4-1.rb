#!/usr/bin/env ruby
#encoding: utf-8
require 'sqlite3'
db=SQLite3::Database.new("test.db")
db.transaction{
  db.execute("SELECT * FROM mytbl;"){|row|
    printf("%9d:%s\n",row[0],row[1])
  }
}
db.close
