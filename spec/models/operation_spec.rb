require 'rails_helper'

RSpec.describe Operation, type: :model do
  subject { build(:operation) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:odate) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
  end
end
