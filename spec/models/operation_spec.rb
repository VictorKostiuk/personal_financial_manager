require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:category) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:operations) }
  end
end