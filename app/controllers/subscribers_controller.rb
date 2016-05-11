class SubscribersController < ApplicationController
  before_action :set_company
  before_action :set_subscriber_group
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /subscriber_groups/new
  def new
    @subscriber = @subscriber_group.subscribers.new
  end

  # GET /subscriber_groups/1/edit
  def edit
  end

  # POST /subscriber_groups
  # POST /subscriber_groups.json
  def create
    @subscriber = @subscriber_group.subscribers.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        @subscriber.custom_field_values.destroy_all
        @company.custom_fields.each do |custom_field|
          @subscriber.custom_field_values.create(custom_field_id: custom_field.id,value: params["#{custom_field.id}"]) unless params["#{custom_field.id}"].blank?
        end
        format.html { redirect_to subscriber_group_path(@subscriber_group), notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { render :new }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriber_groups/1
  # PATCH/PUT /subscriber_groups/1.json
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        @subscriber.custom_field_values.destroy_all
        @company.custom_fields.each do |custom_field|
          @subscriber.custom_field_values.create(custom_field_id: custom_field.id,value: params["#{custom_field.id}"]) unless params["#{custom_field.id}"].blank?
        end
        format.html { redirect_to subscriber_group_path(@subscriber_group), notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber }
      else
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriber_groups/1
  # DELETE /subscriber_groups/1.json
  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to subscriber_group_path(@subscriber_group), notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_subscriber_group
    @subscriber_group = @company.subscriber_groups.find(params[:subscriber_group_id])
  end

  def set_subscriber
    @subscriber = @subscriber_group.subscribers.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscriber_params
    params.require(:subscriber).permit(:name,:email,:contact)
  end
end
