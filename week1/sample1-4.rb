#! /usr/bin/env ruby
# encording utf-8

class Animal
  def initialize(name,cry)
    @name=name
    @cry=cry
  end

  def speak
    puts @cry
  end

  def introduce
    puts @name
  end
end

class Cow < Animal
  def initialize
    super("cow","moooo!")
  end
end

class Cat < Animal
  def initialize
    super("cat","nyaaaaaa!")
  end
end

def call(obj)
  obj.speak
end

def introduce(obj)
  obj.introduce
end

cow=Cow.new
cat=Cat.new

call(cow)
call(cat)

introduce(cow)
introduce(cat)

