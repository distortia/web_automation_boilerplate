Given(/^I am on the web site$/) do
  visit_page HomePage
  expect(@current_page.title).to eq(@current_page.expected_page_title)
end

Then(/^the page contains the correct data for the (.*)$/) do |content|
    @current_page.validate_data_for(content.gsub(' ', '_'))
end

And(/^I fill out the (.*) field with (.*)$/) do |field, text|
  @current_page.send('input_text_' + field.gsub(' ','_') + '=', text)
end

Then(/^the (.*) button is (active|inactive)$/) do |button, active_or_inactive|
  expect(@current_page.send('btn_' + button.gsub(' ', '_') + '_' + active_or_inactive + '?')).to eq true
end

And(/^I click the (.*) button$/) do |button|
  @current_page.send('btn_' + button.gsub(' ', '_'))
end

Then(/^I am on the (.*) page$/) do |page|
  on_page @current_page.class_for(page)
  expect(@current_page.title).to eq @current_page.expected_page_title
end


Given(/^I navigate to the (.*) page$/) do |page|
  page_to_go_to = @current_page.class_for(page)
  route = @current_page.route_for(page)
  navigate_to(page_to_go_to, :using => route)
end

Then(/^the (.*) button is enabled$/) do |button|
  expect(@current_page.send('btn_' + button.gsub(' ', '_') + '_active?')).to eq true
end

And(/^I click the (.*) link$/) do |link|
  @current_page.send('link_' + link.gsub(' ', '_'))
end

Then(/^the (.*) text field contains (.*)$/) do |text_field, text|
  expect(@current_page.send('input_text_' + text_field.gsub(' ', '_'))).to eq text
end

Then(/^I am on the (.*) page on a new tab$/) do |page|
  @browser.windows.last.use
  on_page @current_page.class_for(page)
  sleep 1
  expect(@current_page.title).to eq @current_page.expected_page_title
end

And(/^I (uncheck|check) the (.*) checkbox$/) do |check_or_uncheck, checkbox|
  @current_page.send(check_or_uncheck + '_' + checkbox.gsub(' ', '_') + '_checkbox')
end

Then(/^I am redirected to (.*)$/) do |given_url|
  expect(@browser.url).to eq given_url
end

Then(/^the page contains the correct input data for the (.*)$/) do |content|
  @current_page.validate_input_data_for(content.gsub(' ', '_'))
end