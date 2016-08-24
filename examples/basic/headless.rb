require 'selenium-webdriver'
require 'minitest/autorun'
require 'rspec/expectations'

class AmazonTest < MiniTest::Test
  def setup
    @driver = Selenium::WebDriver.for(:remote, :url => "http://localhost:32768/wd/hub", :desired_capabilities => :firefox)
  end

  def test_post
    @driver.get 'http://www.amazon.com'
    assert_equal(@driver.title, "Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more")
    @driver.save_screenshot 'amazon.png'
  end

  def teardown
    @driver.quit
  end

end
