class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  rescue_from ::Exception, with: :error_occurred

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
