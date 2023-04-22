# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Content, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:original_title) }
    it { is_expected.to respond_to(:year) }
    it { is_expected.to respond_to(:content_type) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:image) }
    it { is_expected.to respond_to(:rating) }
    it { is_expected.to respond_to(:seasons) }
    it { is_expected.to respond_to(:episodes) }
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

  describe 'enums' do
    it { is_expected.to define_enum_for(:content_type).with_values(movie: 0, tv_shows: 1) }
  end
end
