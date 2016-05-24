require_relative 'mio_page'
require_relative '../../config/mio_constants'

class MioLoginPage < MioPage

  page_url MioConstants::ROOT_URL

  text_field  :username_field, id: 'j_username'
  text_field  :password_field, id: 'j_password'
  button      :submit_button, id: 'submit_control-button'

  def log_in(user=MioConstants::ADMIN_USER)
    true if @browser.link(title: 'Logout').present?
    self.username_field = user[:mio_username]
    self.password_field = user[:mio_password]
    submit_button
  end

end
