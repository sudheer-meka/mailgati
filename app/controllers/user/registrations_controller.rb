class User::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end
  #
  # def user_email_validation
  #   @user = User.where(email: params[:email].downcase)
  #   if @user.blank?
  #     render json: {status: true}
  #   else
  #     render json: {status: false}
  #   end
  # end

  def create
    build_resource(resource_params)
    @company = Company.create(name: params[:company])
    resource.company_id = @company.id
    session[:company_id] = @company.id
    if resource.save!
      @group = @company.subscriber_groups.create(name: 'Test')
      @group.subscribers.create(email: resource.email,name: "#{resource.first_name} #{resource.last_name}",contact: resource.contact)
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => root_url #after_sign_up_url_for(resource) TODO change post migration
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_data_after_sign_in!
        respond_with resource, :location => root_path
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end


  def resource_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :company, :contact)
  end

  private :resource_params

end
