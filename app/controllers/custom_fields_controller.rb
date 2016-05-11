class CustomFieldsController < ApplicationController
  before_action :set_company
  before_action :set_custom_field, only: [:show, :edit, :update, :destroy]

  def index
    @custom_fields = @company.custom_fields
  end

  # GET /custom_fields/1
  # GET /custom_fields/1.json
  def show
  end

  # GET /custom_fields/new
  def new
    @custom_field = @company.custom_fields.new
  end

  # GET /custom_fields/1/edit
  def edit
  end

  # POST /custom_fields
  # POST /custom_fields.json
  def create
    @custom_field = @company.custom_fields.new(custom_field_params)
    respond_to do |format|
      if @custom_field.save
        
        format.html { redirect_to email_settings_email_templates_url, notice: 'Custom Field was successfully created.' }
        format.json { render :show, status: :created, location: @custom_field }
      else
        format.html { render :new }
        format.json { render json: @custom_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_fields/1
  # PATCH/PUT /custom_fields/1.json
  def update
    respond_to do |format|
      if @custom_field.update(custom_field_params)
        format.html { redirect_to email_settings_email_templates_url, notice: 'Custom Field was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_field }
      else
        format.html { render :edit }
        format.json { render json: @custom_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_fields/1
  # DELETE /custom_fields/1.json
  def destroy
    @custom_field.destroy
    respond_to do |format|
      format.html { redirect_to email_settings_email_templates_url, notice: 'Custom Field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_custom_field
    @custom_field = @company.custom_fields.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def custom_field_params
    params.require(:custom_field).permit(:name)
  end
end
