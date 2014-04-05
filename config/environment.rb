# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
MyMint::Application.initialize!

Date::DATE_FORMATS[:default] = "%m/%d/%Y"