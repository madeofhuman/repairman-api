class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  def not_found
    render json: {}, status: 404
  end

  private

  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call[:user]
  end

  def require_admin
    redirect_to cars_path unless current_user.admin?
  end
end
