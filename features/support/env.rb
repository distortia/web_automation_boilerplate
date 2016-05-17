require 'watir-webdriver'
require 'page-object'
require 'data_magic'
require 'rspec/expectations'
require 'rspec/matchers'
require 'allure-cucumber'
require 'require_all'
require_rel '../pages/'
require_rel 'routes'

World(PageObject::PageFactory)
DataMagic.yml_directory = 'data'


include AllureCucumber::DSL

AllureCucumber.configure do |config|
  config.output_dir = "allure"
end