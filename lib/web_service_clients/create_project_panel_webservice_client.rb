require_relative 'fetch_panel_webservice_client'

##
# Retrieves metadata definition to create accessors for the Create Project web page
class CreateProjectPanelWebserviceClient < FetchPanelWebserviceClient

  def initialize(user=WSUser.new, _url=nil)
    super(user, build_url_for_data_definition('project-metadata'))
  end

end