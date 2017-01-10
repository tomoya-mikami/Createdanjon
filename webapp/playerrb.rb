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
id=cgi["id"]
name=cgi["name"]
map=Array.new(25)
i=0;
db.transaction(){
  db.execute("select panel_content from panel where map_id=?;",id){|row|
    map[i]=row[0]
    i=i+1
  }
}
db.close
count = 0
now = 0
start =0
goal=0
box=Math.sqrt(25)-1
for l in 0..24 do
    if map[l]==98
        start=l
    elsif map[l]==99
        goal=l
    end
end
print <<-EOF
<!DOCUTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/control.js"></script>
<script>
    var ca;
    var now_position;
    var size=#{box+1}
    window.onload=function(){
        ca=document.getElementById("chara");
        console.log(ca);
        now_position = #{start}
        init(now_position,ca);
    };
    var i =0;
    var j_map=[];
EOF
for l in 0..24 do
    print <<-EOF
    j_map.push(#{map[l]})
EOF
end
print <<-EOF
console.log(j_map)
</script>
</head>
<body>
    <h1>#{name}</h1>
    <div id="gamemain">
        <div id="gamebord">
            <table>
            <tr>
EOF
map.each do|num|
    if num==0 then
        print <<-EOF
        <td  class="map"><img src="img/stage1.png"></td>
        EOF
    elsif num==1 then
        print <<-EOF
        <td  class="map"><img src="img/stage2.png"></td>
        EOF
    elsif num==98 then
        print <<-EOF
        <td  class="map"><img src="img/stage98.png"></td>
        EOF
    elsif num==99 then
        print <<-EOF
        <td  class="map"><img src="img/stage99.png"></td>
        EOF
    end
    count=count+1
    if count>box then
        count=0
        print <<-EOF
        </tr>
        EOF
        if (now/5)!=4 then
            print <<-EOF
            <tr>
            EOF
        end
    end
    now=now+1
end
print <<-EOF
            </table>
        </div>
        <div id="chara"><img src="img/gamechara.png" width="100px" height="100px"></div>
    </div>
</body> 
</html>
EOF

