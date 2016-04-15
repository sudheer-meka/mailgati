class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_user_signed_in, only: "index"
  before_action :authenticate_user!
  rescue_from ::Exception, with: :error_occurred
  layout :layout_by_resource

  def open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then
        Roo::CSV.new(file.path,{file_warning: :ignore})
      when '.xls' then
        Roo::Excel.new(file.path, {file_warning: :ignore})
      when '.xlsx' then
        Roo::Excelx.new(file.path,{file_warning: :ignore})
      else
        raise "Unknown file type: #{file.original_filename}"
    end
  end

  def check_user_signed_in
    if current_user.nil?
      redirect_to controller: 'devise/sessions', action: 'new'
    end
  end

  def layout_by_resource
    if (devise_controller? && resource_name == :user) or controller_name == 'registrations'
      'devise'
    else
      'custom_layout'
    end
  end


  def error_occurred(exception)
    Rails.logger.error("backtrace-----#{exception.backtrace}===========>>>>>>>>>>>>>>>.")
    Rails.logger.error("message -----#{exception.message}===========>>>>>>>>>>>>>>>.")
    unless request.xhr?
      redirect_to :back, :alert => exception.message unless Rails.env.development?
    else
      render js: "alert('Sorry Something Went Wrong ')"
    end
  end
end
