class WelcomeController < ApplicationController
  def index
    if current_user.email =='systemadmin@mailgati.com'
      redirect_to admin_root_url
    else
      redirect_to email_templates_path
    end
  end
end
