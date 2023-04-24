# frozen_string_literal: true

require 'rails_helper'

include Requests::JsonHelpers

RSpec.describe 'Root', type: :request do
  describe '/GET /' do

    it 'returns a success message' do
      get root_path

      expect(json).not_to be_empty
      expect(json['message']).to eq('It works!')
      expect(response).to have_http_status(:ok)
    end
  end
end
