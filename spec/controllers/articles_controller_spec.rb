require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let(:attributes) { FactoryGirl.attributes_for(:article).except(:user) }

  before do
    expect(response).to be_success
  end

  context 'when not logged in' do
    describe '#index' do
      before { get :index }
      it { is_expected.to respond_with 200 }
    end

    describe '#new' do
      before { get :new }
      it { is_expected.to redirect_to(:new_session) }
    end

    describe '#create' do
      before { post :create, article: attributes }
      it { is_expected.to redirect_to(:new_session) }
    end

    describe '#edit' do
      before { get :edit, id:5 }
      it { is_expected.to redirect_to(:new_session) }
    end

    describe '#update' do
      before { put :update, id: 5, article: attributes }
      it { is_expected.to redirect_to(:new_session) }
    end

    describe '#destroy' do
      before { delete :destroy, id:5 }
      it { is_expected.to redirect_to(:new_session) }
    end
  end


  context 'when logged in' do
    let(:user) { FactoryGirl.build :user }
    before do
      allow_any_instance_of(ArticlesController).to receive(:current_user).
                                                    and_return(user)
    end

    describe '#index' do
      before { get :index }
      it { is_expected.to respond_with 200 }
    end

    describe 'single article actions' do
      let(:article) { double }

      describe '#new' do
        before { get :new }
        it { is_expected.to respond_with 200 }
      end

      describe '#create' do

        it 'redirect to article index if succeeded' do
          expect {
            post :create, article: attributes
            }.to change(Article, :count).by(1)
          expect(response).to redirect_to(:articles)
        end

        it 'renders new unless succeeded' do
          expect(Article).to receive(:new).and_return(article)
          expect(article).to receive(:attributes=).with(attributes).
            and_return(article)
          expect(article).to receive(:user).and_return(nil)
          expect(article).to receive(:user=).with(user).
            and_return(article)
          expect(article).to receive(:save).and_return(false)
          post :create, article: attributes
          expect(response).to render_template(:new)
        end
      end

      context 'with an existing article' do
        before do
          expect(Article).to receive(:find).with('5').and_return(article)
        end
        
        describe '#edit' do
          before { get :edit, id:5 }
          it { is_expected.to respond_with 200 }
        end

        describe '#update' do
          before do
            expect(article).to receive(:attributes=).with(attributes).
              and_return(article)
            expect(article).to receive(:user).and_return(user)
          end

          it 'redirect to article index if succeeded' do
            expect(article).to receive(:save).and_return(true)
            put :update, id: 5, article: attributes
            expect(response).to redirect_to(:articles)
          end

          it 'renders new unless succeeded' do
            expect(article).to receive(:save).and_return(false)
            put :update, id: 5, article: attributes
            expect(response).to render_template(:new)
          end

        end

        describe '#destroy' do
          before { expect(article).to receive(:destroy).and_return(true) }
          before { delete :destroy, id:5 }
          it { is_expected.to redirect_to(:articles) }
        end
      end
    end
  end

end
