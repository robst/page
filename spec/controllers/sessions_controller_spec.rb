require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe '#new' do
    before { get :new }
    it { is_expected.to respond_with 200 }
  end

  describe '#destroy' do
    before { get :destroy }
    it { is_expected.to redirect_to(:root) }
  end

end
