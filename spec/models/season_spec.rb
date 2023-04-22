# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to(:number) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:tv_show) }
    it { is_expected.to have_many(:episodes).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
  end

end
