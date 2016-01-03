class EmailTemplatesController < ApplicationController
  before_action :set_email_template, only: [:show, :edit, :update, :destroy,:get_import_file]

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
    upload_file = params[:upload_file]

    spreadsheet = open_spreadsheet(upload_file)
    email_details_map = Hash.new
    spreadsheet.each_with_pagename do |name, sheet|
      Rails.logger.info "SHEET NAME ====== >>>> #{name}"
      header = sheet.first
      sheet.each_with_index do |row, index|
        if index > 0
          begin
            details_key_value_pair = {}
            count = 1
            header[1..-1].each_with_index do |i|
              details_key_value_pair[i] = row[count]
              count += 1
            end
            email_details_map[row[0]] = details_key_value_pair
          rescue Exception => invalid
            @error = true
            @message = invalid.message
          end
          break if @error
        end
      end
      break if @error
    end
    email_template = EmailTemplate.find(params[:template_id])
    email_details_map.each_pair do |key,value|
      Notification.delay.send_notification(key,value,email_template,current_user)
    end
    redirect_to email_generators_email_templates_path,notice: 'Emails Are Triggered'
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
