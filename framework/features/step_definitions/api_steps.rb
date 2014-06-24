Given /^I make an API request for city ID ([^"]*)$/ do |id|
  request = "http://api.openweathermap.org/data/2.5/weather?id=#{id}"
  resp = Net::HTTP.get_response(URI.parse(request))
  @data = resp.body

end

Then /^I parse API response$/ do
  @result = JSON.parse(@data)
end

And /^I print "(.*)" name and humidity$/ do |city_name|
  @result["name"].should == city_name
  puts "City " + @result["name"]
  puts "Humidity is " + (@result["main"]["humidity"]).to_s
end





