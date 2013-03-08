require 'capybara'
require 'rspec'
require 'capybara/dsl'

include Capybara::DSL

$your_pandora_email = "YOUR EMAIL"
$your_pandora_password = "YOUR PASSWORD"

Capybara.run_server = false
Capybara.default_wait_time = 5
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.current_driver = :selenium_chrome

describe 'deleting 20 stations' do
  it "deletes top 20 pandora stations" do
    visit("http://www.pandora.com/account/sign-in")
    fill_in('email', :with => $your_pandora_email)
    fill_in('password', :with => $your_pandora_password)
    find('.loginButton').click
    sleep 2
    20.times do 
      first('div.optionsItem').click
      click_on("Delete this station")
      sleep 2
    end
  end
end