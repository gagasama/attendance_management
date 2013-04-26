require 'rubygems'
require 'rest_client'
start_time="2013-04-22"
end_time = "2013-05-10"
holidays = RestClient.get("http://www.google.com/calendar/feeds/japanese@holiday.calendar.google.com/public/full-noattendees?start-min=#{start_time}&start-max=#{end_time}&max-results=10&alt=json")

require 'json'
puts parsed_holidays = JSON.parse(holidays)
JSON.load(holidays, proc{|v| puts v})
#puts parsed_holidays['feed'].keys
parsed_holidays['feed']['entry'].each{|holidays_entry|
  holidays_entry['gd$when'].each{|holiday| puts holiday['startTime']        }

}
#puts parsed_holidays['feed']['entry'][0]['gd$when'][0]['startTime']
puts JSON.pretty_generate(parsed_holidays['feed']['entry'][0])
