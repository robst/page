require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before do
    expect(response).to be_success
  end

  describe '#index' do
    let(:articles) { double }

    it 'with get renders the action' do
      expect(Article).to receive(:all).and_return(articles)
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'single article actions' do
    let(:article) { double }
    let(:attributes) { FactoryGirl.attributes_for(:article).except(:user) }

    describe '#new' do
      it 'with get render the new action' do
        expect(Article).to receive(:new).and_return(article)
        get :new
        expect(response).to render_template(:new)
      end
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
        it 'with get render the action with new template' do
          get :edit, id:5
          expect(response).to render_template(:new)
        end
      end

      describe '#update' do
        before do
          expect(article).to receive(:attributes=).with(attributes).
            and_return(article)
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
        it 'redirect to article index' do
          expect(article).to receive(:destroy).and_return(true)
          delete :destroy, id:5
          expect(response).to redirect_to(:articles)
        end
      end
    end
  end

end
