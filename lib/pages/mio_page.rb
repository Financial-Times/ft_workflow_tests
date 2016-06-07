# frozen_string_literal: true
require 'page-object'

##
# Base class for all Mio PageObjects
class MioPage

  include PageObject

  element :site_header, id: 'TBC'
  element :test_element, id: 'textarea-test_element'


  ##
  # Extracts element type from Panel format IDs
  #
  # @param [String] ID tag of element <element id=<ID>
  # @return String
  def self.element_type(element_id_value)
    puts element_id_value.split('-', 2)[0]
    element_id_value.split('-', 2)[0]
  end

  ##
  # Extracts element ID name from Panel format IDs
  #
  # @param [String] ID tag of element <element id=<ID>
  # @return String
  def self.element_id(element_id_value)
    puts element_id_value.split('-', 2)[1]
    element_id_value.split('-', 2)[1]
  end

  # Retrieves element descriptions from web service and defines them as
  # PageObject::Elements
  #
  # @param a webservice_client [MioFetchPanelWebserviceClient]
  # @return PageObject::Element::TextArea
  def self.define_page_elements(webservice_client)
    webservice_client.extract_text_field_elements.each_key do |name|
      element_name = name.gsub('-', '_')
      element = textarea(element_name, id: Regexp.new(name))
      element
  end

  # @return PageObject::Element::SelectList
  webservice_client.extract_selector_elements.each_key do |name|
    select_list(name, id: Regexp.new(name))
  end

  # @return PageObject::Element::Link
  webservice_client.extract_url_elements.each_key do |name|
    link(name, id: Regexp.new(name))
  end

  # @return PageObject::Element
  webservice_client.extract_boolean_elements.each_key do |name|
    element(name, id: 'TBC') # TBC - depends on implementation
  end

  # @return PageObject::Element::Image
  webservice_client.extract_image_elements.each_key do |name|
    image(name, id: Regexp.new(name))
  end
end

end
