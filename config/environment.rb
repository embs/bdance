# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Bdance::Application.initialize!
Time::DATE_FORMATS[:horary_time] = "%I:%M %p"
