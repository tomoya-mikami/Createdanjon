#!/usr/bin/env ruby
# encoding: utf-8
require "cgi"
cgi=CGI.new
data=open("bbsdata.txt","r:utf-8")
message=CGI.escapeHTML(data.read)
data.close
print cgi.header("text/html; charset=utf-8")
print <<-EOF
<html>
<head></head>
<body>
<script type="text/javascript">
  function pre_check(frm){
    var mess=document.getElementById('message').value;
    var name=document.getElementById('name').value;
    var myRe = /.*<.*>.*/
    var ret=true;
    if(mess.length==0 || name.length==0){
      alert("名前と本文を入力して下さい");
      ret=false;
    }
    if(myRe.test(mess) || myRe.test(name)){
      alert("HTMLのタグは使えません");
      ret=false;
    }
    return ret;
  }
</script>
  <h1>1行掲示板</h1>
  <p>メッセージをどうぞ</p>
  <form action="update.rb" method="post" onsubmit="return pre_check()">
  メッセージ: <input type="text" name="message" id="message">
  お名前: <input type="text" name="name" id="name"></br>
  <input type="submit" value="送信">
  <input type="reset" value="クリア">
  </br>
  </form>
  <p>-----------------------------------</p>
  <pre>
  #{message}
  </pre>
</body>
</html>
EOF
