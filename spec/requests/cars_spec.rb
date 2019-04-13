# frozen_string_literal: true

require 'rails_helper'
include RequestSpecHelper

RSpec.describe 'Cars API', type: :request do
  # add cars owner
  let(:user) { create(:user) }
  # initialize test data
  let!(:cars) { create_list(:car, 10, created_by: user.id) }
  let(:car_id) { cars.first.id }

  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /cars
  describe 'GET /cars' do
    # make HHTP get request before each example
    before { get '/cars', params: {}, headers: headers }

    it 'returns cars' do
      # Note `json` is a custom helper to parse JSON response
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /cars/:id
  describe 'GET /cars/:id' do
    before { get "/cars/#{car_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the car' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(car_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:car_id) { 100 }

      it 'returns a status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Car/)
      end
    end
  end

  # Test suite for POST /cars
  describe 'POST /cars' do
    # valid payload
    let(:valid_attributes) do
      {
        make: 'Bugatti',
        year: 2019,
        trim: 'cool trim',
        model: 'Veyron',
        created_by: user.id.to_s
      }.to_json
    end

    context 'when the request is valid' do
      before { post '/cars', params: valid_attributes, headers: headers }

      it 'creates a car' do
        expect(json['make']).to eq('Bugatti')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { make: nil }.to_json }
      before { post '/cars', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Make can't be blank, Year can't be blank, Model can't be blank, Trim can't be blank/)
      end
    end
  end

  # Test suite for PUT /cars/:id
  describe 'PUT /cars/:id' do
    let(:valid_attributes) { { make: 'Chrysler' }.to_json }

    context 'when the record exists' do
      before { put "/cars/#{car_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /cars/:id
  describe 'DELETE /cars/:id' do
    before { delete "/cars/#{car_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
