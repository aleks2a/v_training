Given /^I make an API request for city ID ([^"]*)$/ do |id|
  # creating request API url
  request = "http://api.openweathermap.org/data/2.5/weather?id=#{id}"
  # send request and store response in 'resp' variable
  resp = Net::HTTP.get_response(URI.parse(request))
  @data = resp.body
end

Then /^I parse API response$/ do
  # parse response to hash and store in '@result'
  @result = JSON.parse(@data)
end

And /^I print "(.*)" name and humidity$/ do |city_name|
  @result["name"].should == city_name
  puts "City " + @result["name"]
  puts "Humidity is " + (@result["main"]["humidity"]).to_s
end


Then(/^I should get response with key and values$/) do |table|
  table.raw.each do |key, value|
    @result[key].should == value
  end
end