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

    describe '#new' do
      it 'with get render the new action' do
        expect(Article).to receive(:new).and_return(article)
        get :new
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

      describe '#show' do
        it 'with get render the action and show' do
          get :show, id:5
          expect(response).to render_template(:show)
        end
      end
    end
  end

end
