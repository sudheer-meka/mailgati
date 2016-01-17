class EmailTemplatesController < ApplicationController
  before_action :set_email_template, only: [:show, :edit, :update, :destroy, :get_import_file]
  # GET /email_templates
  # GET /email_templates.json
  def index
    @email_templates = current_user.email_templates
  end

  # GET /email_templates/1
  # GET /email_templates/1.json
  def show
  end

  # GET /email_templates/new
  def new
    @email_template = current_user.email_templates.new
  end

  # GET /email_templates/1/edit
  def edit
  end

  # POST /email_templates
  # POST /email_templates.json
  def create
    @email_template = current_user.email_templates.new(email_template_params)

    respond_to do |format|
      if @email_template.save
        format.html { redirect_to email_templates_url, notice: 'Email template was successfully created.' }
        format.json { render :show, status: :created, location: @email_template }
      else
        format.html { render :new }
        format.json { render json: @email_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_templates/1
  # PATCH/PUT /email_templates/1.json
  def update

    respond_to do |format|
      if @email_template.update(email_template_params)
        format.html { redirect_to email_templates_url, notice: 'Email template was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_template }
      else
        format.html { render :edit }
        format.json { render json: @email_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_templates/1
  # DELETE /email_templates/1.json
  def destroy
    @email_template.destroy
    respond_to do |format|
      format.html { redirect_to email_templates_url, notice: 'Email template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def email_generators
  end

  def email_settings
    # @email_setting = EmailSetting.find_or_initialize_by(user_id: current_user.id).delete
    @email_setting = EmailSetting.find_or_initialize_by(user_id: current_user.id)
  end

  def save_email_settings
    @email_setting = EmailSetting.find_or_initialize_by(user_id: current_user.id)
    @email_setting.address = params[:email_setting][:address]
    @email_setting.domain = params[:email_setting][:domain]
    @email_setting.port = params[:email_setting][:port]
    @email_setting.username = params[:email_setting][:username]
    @email_setting.password = params[:email_setting][:password]
    @email_setting.authentication = params[:email_setting][:authentication]
    @email_setting.enable_starttls_auto = params[:email_setting][:enable_starttls_auto]
    @email_setting.save!
    redirect_to email_settings_email_templates_url, notice: 'Email setting was successfully saved.'
  end

  def get_import_file
    report_content = EmailTemplateReport::Engine.new(params[:id]).email_template_statement
    report_content.write "public/report_content.xls"
    send_file "public/report_content.xls", :type => "application/vnd.ms-excel", :filename => "Email Template Upload.xls", disposition: 'attachment'
  end

  def export_file
    require 'securerandom'
    begin
      file_name = params[:upload_file].original_filename
      raise "Unacceptable File Format." unless File.extname(file_name) == '.xls'
      raise 'File size must be less than 100MB.' if params[:upload_file].size > 100.megabytes
      directory = "public/uploads"
      ucid = SecureRandom.hex
      path = File.join(directory, "#{current_user.email}-#{ucid}.xls")
      File.open(path, "wb") { |f| f.write(params[:upload_file].read) }
      email_template = EmailTemplate.find(params[:template_id])
      subject = email_template.subject
      body = email_template.body
      subject_variables = subject.split(/<(@[._a-zA-Z\d]*)>/)
      subject_variables.select! { |var| var if var[0] == '@' }.compact
      # body_variables = body.split(/&lt;(.*?)&gt;/)
      # body_variables += body.split(/%3C(.*?)%3E/)
      body_variables = body.split(/<(@[._a-zA-Z\d]*)>/)
      body_variables.select! { |var| var if var[0] == '@' }.compact
      email_setting = current_user.email_setting
      settings = {
      :address => email_setting.address, # intentionally
      :port => email_setting.port, # intentionally
      :domain => email_setting.domain, #insetad of localhost.localdomain'
      :user_name => email_setting.username,
      :password => email_setting.password,
      :authentication => email_setting.authentication # or smthing else
      }
      # Notification.delay.send_notification("#{current_user.email}-#{ucid}.xls",email_template,subject_variables,body_variables,settings)
      EmailGeneratorWorker.perform_async("#{current_user.email}-#{ucid}.xls",email_template.id,subject_variables,body_variables,settings)
      
      redirect_to email_generators_email_templates_path, notice: 'Emails Are Triggered'
      return
    rescue Exception => invalid
      @error = true
      @message = invalid.message
      redirect_to email_generators_email_templates_path, notice: @message
      return
    end

    # email_setting = current_user.email_setting
    # settings = {
    #     :address => email_setting.address, # intentionally
    #     :port => email_setting.port, # intentionally
    #     :domain => email_setting.domain, #insetad of localhost.localdomain'
    #     :user_name => email_setting.username,
    #     :password => email_setting.password,
    #     :authentication => email_setting.authentication # or smthing else
    # }
    # upload_file = params[:upload_file]
    # email_template = EmailTemplate.find(params[:template_id])
    # subject = email_template.subject
    # body = email_template.body
    # subject_variables = subject.split(/<(.*?)>/)
    # subject_variables.select! { |var| var if var[0] == '@' }.compact
    # body_variables = body.split(/&lt;(.*?)&gt;/)
    # body_variables += body.split(/%3C(.*?)%3E/)
    # body_variables.select! { |var| var if var[0] == '@' }.compact
    # spreadsheet = open_spreadsheet(upload_file)
    # spreadsheet.each_with_pagename do |name, sheet|
    #   Rails.logger.info "SHEET NAME ====== >>>> #{name}"
    #   header = sheet.first
    #   sheet.each_with_index do |row, index|
    #     if index > 0
    #       begin
    #         details_key_value_pair = {}
    #         count = 1
    #         header[1..-1].each_with_index do |i|
    #           details_key_value_pair[i] = row[count]
    #           count += 1
    #         end
    #         Notification.delay.send_notification(row[0], details_key_value_pair, email_template,subject_variables,body_variables,settings)
    #       rescue Exception => invalid
    #         @error = true
    #         @message = invalid.message
    #       end
    #       break if @error
    #     end
    #   end
    #   break if @error
    # end
    redirect_to email_generators_email_templates_path, notice: 'Emails Are Triggered'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_email_template
    @email_template = current_user.email_templates.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def email_template_params
    params.require(:email_template).permit(:title, :subject, :body)
  end
end
