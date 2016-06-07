class Support::V1::ApiTicketsController < Support::V1::BaseApiController
  require 'net/http'

  def event_webhook
    puts "email===>>>>>>#{params}"
    user = User.where(email: params[:email_address]).first
    if user
      employee = user.user_info
      render json: {ucid: employee.id.to_s,mobile: user.contact,first_name: employee.first_name,last_name: employee.last_name, exception_occured: 'N'}
    else
      render json: {message: 'Employee Not Found', exception_occured: 'Y'}
    end
  end
end
