class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_response(success, data)
    render json: data, status: (success ? 200 : (data.has_key?(:status) ? data[:status] : 500))
  end
end
