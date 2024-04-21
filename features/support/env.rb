require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper.rb'

BROWSER = ENV['BROWSER']
AMBIENTE = ENV['AMBIENTE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

World(PageObjects)

Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    CAPYBARA::SELENIUM::DRIVER.NEW(APP, :BROWSER => :CHROME,)
  elsif BROWSER.eql?('firefox')
    CAPYBARA::SELENIUM::DRIVER.NEW(APP, :BROWSER => :FIREFOX, :MARIONETTE =>TRUE)
  elsif BROWSER.eql?('edge')
    CAPYBARA::SELENIUM::DRIVER.NEW(APP, :BROWSER => :EDGE)
  elsif BROWSER.eql?('opera')
    CAPYBARA::SELENIUM::DRIVER.NEW(APP, :BROWSER => :OPERA)
  elsif BROWSER.eql?('safari')
    CAPYBARA::SELENIUM::DRIVER.NEW(APP, :BROWSER => :SAFARI)
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.javascript_driver = :selenium_chrome # Defina isto se você precisar de suporte a JavaScript
  config.app_host = CONFIG['url_padrao']
  config.default_max_wait_time = 5
end
