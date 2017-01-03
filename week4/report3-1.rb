h=Hash.new(0)
io=open("sample3-1.txt","r:UTF-8")
while line=io.gets
  line=line.chomp
  h[line]+=1
end
h.each{|key,value|
  print "#{key} = #{value}\n"
}
