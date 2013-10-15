require 'rubygems'
require 'bundler/setup'

require 'capybara'
require 'capybara/dsl'
require 'honeydew/cucumber'
#require File.join(File.dirname(__FILE__), 'honeydew_logger')

begin
  require 'pry'
rescue LoadError
  # Require pry if available, ignore if not
end

#require File.join(File.dirname(__FILE__), 'amplify_environment')

# Default to css selectors, XPath is hard!
Capybara.default_selector = :css

# FIXME: The firefox driver has been made available due to difficulties
# uploading files with chromedriver, since we support chrome on our devices we
# should move away from this as soon as the problem is fixed.
Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Javascript heavy app, all testing should be done in a proper browser
Capybara.default_driver = :chrome

#if AmplifyEnvironment.qa_environment?
#  Capybara.app_host = 'http://qa-master-playlist.amplify.com'
#else
  # Use a real url for testing purposes
#  Capybara.app_host = 'http://localtest.me:3000'
#end

# Use the capybara DSL
#World(DeviceUserManager)
#World(LibraryHelpers)
World(Capybara::DSL)
#World(NavigationHelpers)

rerun = ENV['RERUN'] == 'true'

AfterConfiguration do
 # AmplifyEnvironment.new.run_setup_tasks(rerun)
end
