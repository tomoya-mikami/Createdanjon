#! /usr/bin/env ruby
# -*- coding: utf-8 -*-
#encording utf-8

def length_out(obj)
  puts obj.length
end

x=[1,2,3]
y="文字列"
length_out(x)
length_out(y)

first = x.shift
puts first
p x
