require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper.rb'
require_relative 'helper.rb'

BROWSER = ENV['BROWSER']
AMBIENTE = ENV['AMBIENTE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

World(Helper)
World(PageObjects)

Capybara.register_driver :selenium do |app|
  case BROWSER
  when 'chrome'
    options = Selenium::WebDriver::Chrome::Options.new
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  when 'chrome_headless'
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  when 'firefox' #não funciona
    options = Selenium::WebDriver::Firefox::Options.new
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  when 'edge'
    options = Selenium::WebDriver::Edge::Options.new
    Capybara::Selenium::Driver.new(app, browser: :edge, options: options)
  when 'opera' #não funciona
    options = Selenium::WebDriver::Opera::Options.new
    Capybara::Selenium::Driver.new(app, browser: :opera, options: options)
  when 'safari' #não funciona
    options = Selenium::WebDriver::Safari::Options.new
    Capybara::Selenium::Driver.new(app, browser: :safari, options: options)
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.javascript_driver = :selenium
  config.app_host = CONFIG['url_padrao']
  config.default_max_wait_time = 5
end
