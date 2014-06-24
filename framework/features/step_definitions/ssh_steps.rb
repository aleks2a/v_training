Given /^I open a SSH connection to host "([^"]*)" with username "([^"]*)" and password "([^"]*)"$/ do |host, username, password|
  @host = host
  @username = username
  @password = password
  @ssh = Net::SSH.start(@host, @username, :password => @password)
end

Then /^I print all Errors from log file$/ do
  result = @ssh.exec! "find /var/log/system.log | wc -l"
  if result.to_i > 0
    error_count = @ssh.exec! "grep -i 'error' /var/log/system.log | wc -l"
    puts "#{@host} error count: #{error_count}"
    if error_count.to_i > 0
      error_detail = @ssh.exec! "grep -i 'error' /var/log/system.log"
      puts error_detail
      fail "Errors found in host #{@host} system.log file"
    end
  else
    fail "system.log file not found in host #{@host}"
  end
end

Then /I close SSH connection/ do
  @ssh.close
end

Given(/^I print all subjects$/) do
  Subject.all_subject
end