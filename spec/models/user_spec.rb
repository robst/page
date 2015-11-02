require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build :user}

  describe 'validations' do
    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password).on(:create) }

    it { is_expected.to validate_uniqueness_of(:username) }
  end
end
