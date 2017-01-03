#! /usr/bin/env ruby
#encording utf-8

class Clock
  def time
    Time.now
  end
end

class AlarmClock < Clock
  def set_alarm(time,listener)
    sleep(time)
    listener.wakeup
  end
end

class ClockSeter
  def wakeup
    puts "wakeup"
  end
end

clock=AlarmClock.new
puts clock.time
clock.set_alarm(5,ClockSeter.new)
puts clock.time
