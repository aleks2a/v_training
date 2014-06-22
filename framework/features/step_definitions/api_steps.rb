Given /^I do API request for city ID ([^"]*)$/ do |id|
  request = "http://api.openweathermap.org/data/2.5/weather?id=#{id}"
  resp = Net::HTTP.get_response(URI.parse(request))
  @data = resp.body

end

Given /^I parse API response$/ do
  @result = JSON.parse(@data)
end



Then /^I print city name and humidity$/ do
  puts "City " + @result["name"]
  puts "Humidity is " + (@result["main"]["humidity"]).to_s
end





