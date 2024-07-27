class Api::PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :update, :destroy]

  # GET /api/prescriptions
  def index
    @prescriptions = Prescription.all
    render json: @prescriptions
  end

  # GET /api/prescriptions/:id
  def show
    render json: @prescription
  end

  # POST /api/prescriptions
  def create
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      render json: @prescription, status: :created, location: api_prescription_url(@prescription)
    else
      render json: @prescription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/prescriptions/:id
  def update
    if @prescription.update(prescription_params)
      render json: @prescription
    else
      render json: @prescription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/prescriptions/:id
  def destroy
    @prescription.destroy
    head :no_content
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:id])
  end

  def prescription_params
    params.require(:prescription).permit(:patient_id, :medicine_id, :dosage, :frequency, :start_date, :end_date)
  end
end
