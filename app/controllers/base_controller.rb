class BaseController < ApplicationController
  before_filter :permit_all_parameter

  private
  def permit_all_parameter
    params.permit!
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