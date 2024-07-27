class Api::DispenseRecordsController < ApplicationController
  before_action :set_dispense_record, only: [:show, :update, :destroy]

  # GET /api/dispense_records
  def index
    @dispense_records = DispenseRecord.all
    render json: @dispense_records
  end

  # GET /api/dispense_records/:id
  def show
    render json: @dispense_record
  end

  # POST /api/dispense_records
  def create
    @dispense_record = DispenseRecord.new(dispense_record_params)
    if @dispense_record.save
      render json: @dispense_record, status: :created, location: api_dispense_record_url(@dispense_record)
    else
      render json: @dispense_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/dispense_records/:id
  def update
    if @dispense_record.update(dispense_record_params)
      render json: @dispense_record
    else
      render json: @dispense_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/dispense_records/:id
  def destroy
    @dispense_record.destroy
    head :no_content
  end

  private

  def set_dispense_record
    @dispense_record = DispenseRecord.find(params[:id])
  end

  def dispense_record_params
    params.require(:dispense_record).permit(:prescription_id, :dispense_time)
  end
end
