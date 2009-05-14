begin
  require File.dirname(__FILE__) + '/../../../../spec/spec_helper'
rescue LoadError
  puts "You need to install rspec in your base application"
  exit
end

require File.dirname(__FILE__) + '/user_sim'
