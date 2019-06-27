class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]
  before_action :require_admin, only: %i[all_cars]

  def index
    @cars = current_user.cars.order('created_at desc')
    render_car_json(@cars)
  end

  def create
    @car = current_user.cars.create!(car_params)
    json_response(@car, :created)
  end

  def show
    render_car_json(@car)
  end

  def update
    @car.update(car_params)
    head :no_content
  end

  def destroy
    @car.destroy
    head :no_content
  end

  # admin methods

  def all_cars
    cars = Car.all.order('created_at desc')
    render_car_json(cars)
  end

  private

  def car_params
    params.permit(:make, :year, :model, :trim)
  end

  def render_car_json(car)
    render json: car,
      include: [
        user: { except: [:password_digest, :admin] },
        quotes: { include: :comments }
      ],
      status: :ok
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
