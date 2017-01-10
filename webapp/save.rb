#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#encording: utf-8
require 'cgi'
require 'sqlite3'
cgi=CGI.new
print cgi.header("text/html;charset=utf-8")
#フォームのデータの受け取り
panel=cgi.params["panel"]
name=cgi.params["name"]
valuecheck=true;
startcheck=false;
goalcheck=false;
num=0;
print <<-EOF
    <!DOCTYPE html>
    <html>
    <body>
    EOF
panel.each{|res|
    if (res.to_i)==101 then
        valuecheck=false;
    end
    if(res.to_i)==98 then
        startcheck=true;
    end
    if(res.to_i)==99 then
        goalcheck=true;
    end
}
if valuecheck==false || startcheck==false || goalcheck=false then
print <<-EOF
    空欄は作らないでください。また、ゴールとスタートは設定してください</br>
    <a href="create.html">作成に戻る</a>
    EOF
else
#データベースの読み取り
begin
  db = SQLite3::Database.new("gamedatabase.db")
rescue => ex
  print <<-EOF
    読み込みに失敗しました</br>
    <a href="enquete_form.rb">投票に戻る</a>
    </body>
    </html>
    EOF
  exit
end
db.transaction(){
    db.execute("insert into map(name) values(?);",name)
}
db.transaction(){
    num=db.execute("select id from map where name=?;",name)
}
num=num.max;
i=0;
panel.each{|res|
    db.transaction(){
        db.execute("insert into panel(map_id,panel_num,panel_content) values(?,?,?)",num,i,res.to_i)
    }
    i=i+1
}
print <<-EOF
    作成ありがとうございます</br>
    <a href="index.rb">ホームに戻る</a>
    <script>
        console.log(#{num});
        console.log(#{panel});
    </script>
    EOF
    end
print <<-EOF
    </body>
    </html>
EOF
