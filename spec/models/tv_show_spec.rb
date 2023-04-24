# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TvShow, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to(:order) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:original_title) }
    it { is_expected.to respond_to(:year) }
    it { is_expected.to respond_to(:type) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:seasons).dependent(:destroy) }
    it { is_expected.to have_many(:episodes).through(:seasons) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:original_title) }
    it { is_expected.to validate_presence_of(:year) }
  end

end
