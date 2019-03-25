class QuotesController < ApplicationController
  before_action :set_car
  before_action :set_quote, only: %i[show update destroy]

  def index
    json_response(@car.quotes)
  end

  def show
    json_response(@quote)
  end

  def create
    @car.quotes.create!(quote_params)
    json_response(@car, :created)
  end

  def update
    @quote.update(quote_params)
    head :no_content
  end

  def destroy
    @quote.destroy
    head :no_content
  end

  private

  def quote_params
    params.permit(:description)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_quote
    @quote = @car.quotes.find_by!(id: params[:id]) if @car
  end
end
