class ApartmentsController < ApplicationController

  def index
    apartments = Apartment.all
    render json: apartments
  end

  def show
    apartment = Apartment.find(params[:id])
    render json: apartment, status: :ok
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def update
    apartment = Apartment.find(params[:id])
    apartment.update!(apartment_params)
    render json: apartment, status: :ok
  end

  def destroy
    apartment = Apartment.find(params[:id])
    apartment.destroy
    head :no_content
  end

  private

  def apartment_params
      params.permit(:number)
  end

end
