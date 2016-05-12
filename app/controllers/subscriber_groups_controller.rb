class SubscriberGroupsController < ApplicationController
  before_action :set_company
  before_action :set_subscriber_group, only: [:show, :edit, :update, :destroy, :import_subscribers, :export_subscribers]

  def index
    @subscriber_groups = @company.subscriber_groups.paginate(page: params[:page], per_page: 10)
  end

  # GET /subscriber_groups/1
  # GET /subscriber_groups/1.json
  def show
    @subscribers = @subscriber_group.subscribers.paginate(page: params[:page], per_page: 10)
  end

  # GET /subscriber_groups/new
  def new
    @subscriber_group = @company.subscriber_groups.new
  end

  # GET /subscriber_groups/1/edit
  def edit
  end

  # POST /subscriber_groups
  # POST /subscriber_groups.json
  def create
    @subscriber_group = @company.subscriber_groups.new(subscriber_group_params)
    respond_to do |format|
      if @subscriber_group.save
        format.html { redirect_to subscriber_groups_url, notice: 'Subscriber Group was successfully created.' }
        format.json { render :show, status: :created, location: @subscriber_group }
      else
        format.html { render :new }
        format.json { render json: @subscriber_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriber_groups/1
  # PATCH/PUT /subscriber_groups/1.json
  def update
    respond_to do |format|
      if @subscriber_group.update(subscriber_group_params)
        format.html { redirect_to subscriber_groups_url, notice: 'Subscriber Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber_group }
      else
        format.html { render :edit }
        format.json { render json: @subscriber_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriber_groups/1
  # DELETE /subscriber_groups/1.json
  def destroy
    @subscriber_group.destroy
    respond_to do |format|
      format.html { redirect_to subscriber_groups_url, notice: 'Subscriber Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import_subscribers
    report_content = SubscriberInfoReport::Engine.new(params[:id], @company.id).subscriber_statement
    report_content.write 'public/report_content.xls'
    send_file 'public/report_content.xls', :type => 'application/vnd.ms-excel', :filename => 'Subscriber Info Upload.xls', disposition: 'attachment'
  end

  def export_subscribers
    upload_file = params[:upload_file]
    if upload_file.present?
      spreadsheet = open_spreadsheet(upload_file)
      @excel_uploader = ExcelUploader.new(@company, current_user)
      @result = @excel_uploader.subscriber_info_upload(spreadsheet,params[:id])
    end
    if @result == 'OK'
      redirect_to subscriber_group_path(params[:id]),notice: 'Subscribers Uploaded Successfully'
    else
      redirect_to subscriber_group_path(params[:id]),alert: @result
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_subscriber_group
    @subscriber_group = @company.subscriber_groups.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def subscriber_group_params
    params.require(:subscriber_group).permit(:name)
  end
end