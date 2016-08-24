require 'selenium-webdriver'
require 'rspec/expectations'

include RSpec::Matchers

  def setup
    @driver = Selenium::WebDriver.for(:remote, :url => "http://localhost:32768/wd/hub", :desired_capabilities => :firefox)
  end

  def teardown
    @driver.quit
  end

  def run
  setup
  yield
  teardown
  end

  run do 
   @driver.get 'http://www.amazon.com'
   expect(@driver.title).to eql 'Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more'
   @driver.save_screenshot 'amazon.png'
  end