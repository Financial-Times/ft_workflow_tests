require_relative 'mio_fetch_panel_webservice_client'

class MioCreateIngestAssetWebserviceClient < MioFetchPanelWebserviceClient

  def initialize(user)
    super(user, build_url_for_data_definition('ingest-metadata'))
  end

end