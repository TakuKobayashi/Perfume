class BaseController < ApplicationController
  before_filter :permit_all_parameter
  before_filter :load_user

  private
  def permit_all_parameter
    params.permit!
  end

  def load_user
    auth_token = session[:auth_token]
    if auth_token.blank?
      auth_token = SecureRandom.hex
      session[:auth_token] = auth_token
    end
    @user = User.find_or_create_by(auth_token: auth_token)
  end

  def render_error(message, status = 200)
    @message = message
    render template: "shared/error", :status => status
  end

  def service_unavailable
    @message = "只今メンテナンス中です"
    render template: "shared/error", :status => :service_unavailable
  end
end