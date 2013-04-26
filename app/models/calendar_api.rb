require'rubygems'
require'google/api_client'
require 'yaml'

client_id = "139636662301-4dtvit56dema93q3ev7cqj2ll37q056j.apps.googleusercontent.com"
client_secret = "SBrIPCSC-J5ep01doSuU1L2A"
scope = "https://www.googleapis.com/auth/calendar"

refresh_token = ""
access_token = "" 

oauth_yaml = YAML.load_file('/Users/makotonakayama/.google-api.yaml')
puts oauth_yaml
client =Google::APIClient.new
client.authorization.client_id = oauth_yaml["client_id"]
client.authorization.client_secret = oauth_yaml["client_secret"]
client.authorization.scope = oauth_yaml["scope"]
client.authorization.refresh_token = oauth_yaml["refresh_token"]
client.authorization.access_token = oauth_yaml["access_token"]
if client.authorization.refresh_token && client.authorization.expired?
  client.authorization.fetch_access_token!
end


service = client.discovered_api('calendar', 'v3')
result = client.execute(:api_method => service.events.list,
			:parameters => {'calendarId' => 'ja.japanese#holiday@group.v.calendar.google.com','orderBy' => 'startTime', 'singleEvents' => 'true', 'timeMax' => '2013-05-12T23:20:50.52Z','timeMin' => '2013-04-12T23:20:50.52Z', 'fields' => 'items/start,items/summary,timeZone'})

x = result.response.env
#"result : #{x.each{|y| puts y}}"
puts x[:body]
