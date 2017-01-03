#! /usr/bin/env ruby
# -*- coding: utf-8 -*-
# encording : utf-8

def Complex_absolute(real,comp)
  r=real ** 2
  c=comp ** 2
  return (r+c)**0.5
end

class Person
  def initialize(name,addr,tel)
    @name=name
    @addr=addr
    @tel=tel
    end
  
  def get_name
    return @name
  end
  
  def get_addr
    return @addr
  end
  
  def get_tel
    return @tel
  end
end

suzuki=Person.new("スズキ足ろう","大阪市","06~")
satou=Person.new("砂糖花子","nishimiya","07^");

puts suzuki.get_tel
puts satou.get_addr.upcase

puts Complex_absolute(1,1)

x=satou.get_tel
puts x
