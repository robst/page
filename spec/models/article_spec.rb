require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { FactoryGirl.build :article}

  describe 'validations' do
    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:content) }

    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
