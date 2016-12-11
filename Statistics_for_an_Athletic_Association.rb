require 'time'

def convert_seconds_hhmmss(seconds)
  hh = (seconds/3600).to_i
  mm = ((seconds%3600)/60).to_i
  ss = ((seconds%3600)%60).to_i
  "#{hh.to_s.rjust(2, "0")}:#{mm.to_s.rjust(2, "0")}:#{ss.to_s.rjust(2, "0")}"
end

def range(results)
  dif = results[-1] - results[0]
  range = convert_seconds_hhmmss(dif).to_s
  range.gsub!(":","|")
end

def average(results)
  sum = 0
  results.each {|result| sum += result.hour*3600 + result.min*60 + result.sec}
  average = convert_seconds_hhmmss(sum/results.size)
  average.gsub!(":","|")
end

def median(results)
  team_mates = results.size
  half_team = team_mates/2
  if team_mates % 2 == 0
    median = average([results[half_team-1],results[half_team]])
  else
    median = (results[half_team].strftime "%H:%M:%S").to_s if team_mates % 2 != 0
    median.gsub!(":","|")
  end
end

def stat(strg)
  results = strg.split(',')
  results.map! do |result|
    single = result.strip.split('|')
    single.map! {|valor| valor.rjust(2, "0")}
    single = single.join(':')
    Time.parse(single)
  end
  results.sort!
  exit if results.empty?
  "Range: #{range(results)} Average: #{average(results)} Median: #{median(results)}" if !results.empty?
end
