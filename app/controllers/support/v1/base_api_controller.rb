class Support::V1::BaseApiController < ActionController::Base
  skip_before_filter  :verify_authenticity_token
  before_filter :restrict_access
  skip_before_filter :authenticate_user!
  private
  def restrict_access
    render json: {exception_message: 'Invalid Access Token', exception_occured: 'Y'}, status: 401 unless '98f5bc66b2c145258a4639ba743e9ee1' == params[:access_token]
  end
end
