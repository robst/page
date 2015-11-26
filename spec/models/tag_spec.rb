require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { FactoryGirl.build :tag, name: 'CrazyTag' }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'methods' do
    it { expect(subject.to_s).to eq(subject.name)}
  end
end
