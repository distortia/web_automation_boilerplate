# Namespacing routes for each specific platform
require 'require_all'
require 'page-object'

# Common Routes shared between the web
PageObject::PageFactory.routes = {
  :default => [],
}