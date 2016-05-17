# Elements and methods common to all pages in the app
# This is the base page that will be inherited by other pages

require 'yaml'

class CommonPage
  include PageObject
  include DataMagic
  include RSpec::Matchers

  # Common Elements

  def yml_file
    YAML.load_file(File.join(__dir__, '../support/data/' + self.page_data_file + '.yml'))
  end

  def validate_data_for(data_key)
    data = yml_file
    expected_data = data[data_key]
    raise "#{self.page_data_file}.yml data missing key: #{data_key}" if expected_data.nil?
    expected_data.each do |key, value|
      if key.start_with? 'img'
        validate_image key
      elsif key.start_with? 'input_text'
        expect(validate_placeholder key).to eq value
      elsif key.start_with? 'btn'
        expect(validate_button key).to eq value
      elsif key.start_with? 'link'
        expect(validate_link key).to eq value
      else
        expect(validate_text key).to eq value
      end
    end
  end

  def validate_input_data_for(data_key)
    data = yml_file
    expected_data = data[data_key]
    raise "#{self.page_data_file}.yml data missing key: #{data_key}" if expected_data.nil?
    expected_data.each do |key, value|
      expect(validate_input_text key).to eq value
    end
  end

  def validate_input_text(key)
    self.send(key + '_element').value
  end

  def validate_ul(key)
    data_cleaner(self.send(key))
  end

  def validate_placeholder(key)
    self.send(key + '_element').placeholder
  end

  def validate_image(key)
    self.send(key + '?')
  end

  def validate_text(key)
    puts "data #{data_cleaner self.send key}"
     data_cleaner(self.send key)
  end

  def validate_button(key)
    data_cleaner(self.send(key + '_element').text)
  end

  def validate_link(key)
    data_cleaner(self.send(key+ '_element').text)
  end
  
  def data_cleaner(text)
    puts "cleaning: #{text}"
    text.gsub("\n", ' ')
  end

  def expected_page_title
    data = yml_file
    data['page_title']
  end

  def populate_page(data_key)
    populate_page_with data_for data_key
  end

  def route_for(page)
    (page.gsub(' ', '_')+ '_page').to_sym
  end

  def class_for(page)
    page = page.split
    page.each do |fragment|
      fragment[0] = fragment[0].capitalize!
    end
    page = page.join
    Object.const_get(page + 'Page')
  end

  def random_email_generator
    random_email = ''
    possible_characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    6.times.map do
      random_email << possible_characters[rand((0..(possible_characters.length - 1)))]
    end
    'nick+' + random_email + '@domain.qa'
  end
end