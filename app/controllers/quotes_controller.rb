class QuotesController < ApplicationController
  before_action :set_car, except: %i[all_quotes show_quote user_quotes]
  before_action :set_quote, only: %i[show update destroy show_quote]
  before_action :require_admin, only: %i[all_quotes show_quote]

  def index
    @quotes = @car.quotes.order('created_at desc')
    render_quotes_json(@quotes)
  end

  def show
    render_quotes_json(@quote)
  end

  def user_quotes
    @quotes = Quote.where(user_id: params['id'])
    render_quotes_json(@quotes)
  end

  def create
    params = {
      car_id: quote_params['car_id'],
      description: quote_params['description'],
      user_id: current_user.id
    }
    quote = @car.quotes.create!(params)
    render_quotes_json(quote, :created)
  end

  def update
    @quote.update(quote_params)
    json_response(@quote)
  end

  def destroy
    @quote.destroy
    head :no_content
  end

  # admin methods

  def all_quotes
    quotes = Quote.all.order('created_at desc')
    render_quotes_json(quotes)
  end

  def show_quote
    quote = Quote.find_by!(id: params[:id])
    render_quotes_json(quote)
  end

  private

  def quote_params
    params.permit(:description, :car_id, :user_id)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def render_quotes_json(quote, status = :ok)
    render json: quote,
      include: [
        :car,
        comments: {
          include: [
            user: { except: [:password_digest] }
          ]
        },
        user: { except: [:password_digest] },
      ],
      status: status
  end

  def set_quote
    @quote = @car.quotes.find_by!(id: params[:id]) if @car
  end
end
