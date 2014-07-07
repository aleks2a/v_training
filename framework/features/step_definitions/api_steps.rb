Given /^I make an API request for city ID ([^"]*)$/ do |id|
  # creating request API url
  request = "http://api.openweathermap.org/data/2.5/weather?id=#{id}"
  # send request and store response in 'resp' variable
  resp = Net::HTTP.get_response(URI.parse(request))
  #save response body (actual response) to variable @data
  @data = resp.body
end

Then /^I parse API response$/ do
  # parse response to hash and store in '@result'
  @result = JSON.parse(@data)
end

And /^I print "(.*)" name and humidity$/ do |city_name|
  # assert value from response with key 'name' should equal 'city_name'
  @result["name"].should == city_name
  puts "City " + @result["name"]
  #@result["main"]["humidity"] is a hash inside hash
  #@result["main"] will return hash map where 'humidity' is a key
  puts "Humidity is " + (@result["main"]["humidity"]).to_s
end


Then(/^I should get response with key and values$/) do |table|
  #parse table from feature file and get values in variables 'key' and 'value'
  table.raw.each do |key, value|
    #assert that @result should have key and value whicj we are sending from feature file
    @result[key].should == value
  end
end