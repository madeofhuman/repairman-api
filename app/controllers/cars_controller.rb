class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]

  def index
    @cars = current_user.cars
    json_response(@cars)
  end

  def create
    @car = current_user.cars.create!(car_params)
    json_response(@car, :created)
  end

  def show
    json_response(@car)
  end

  def update
    @todo.update(todo_params)
    head :no_content
  end

  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def car_params
    params.permit(:make, :year, :model, :trim)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
