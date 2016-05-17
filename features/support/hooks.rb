require 'watir-webdriver'
require 'rspec/expectations'
require 'rspec/matchers'
require 'page-object'
require 'allure-cucumber'
require 'fileutils'
require 'yaml'

include AllureCucumber::DSL

Before do
  @browser = Watir::Browser.new (ENV['BROWSER']||:firefox).to_sym

  if ENV['DEVICE']
    data = YAML.load_file(File.join(__dir__, './devices.yml'))
    dimensions = data[ENV['DEVICE']]

    raise "No device specified: Please specify a device as an ENV variable such as DEVICE=`iphone_6_plus_portrait`\nYou specified #{ENV['DEVICE']}" if dimensions.nil?

    width = dimensions['width']
    height = dimensions['height']

    @browser.window.resize_to(width, height)
  else
    # @browser.window.maximize
  end
end

After do |scenario|
  scenario = scenario.scenario_outline if scenario.respond_to?('scenario_outline')

  ss_dir = "#{File.expand_path("./")}/screenshots"
  FileUtils.mkdir_p "#{ss_dir}"
  ss = DateTime.now.strftime("%d%b%Y%H%M%S")
  @browser.screenshot.save "#{ss_dir}/#{ss}.png"

  @browser.close

  if scenario.failed?
    attach_file("screenshot-#{ss}", File.open("#{ss_dir}/#{ss}.png"))
  end
end

