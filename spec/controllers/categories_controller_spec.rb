require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before do
    @category = Category.create!(name: 'Food', description: 'Categories for food expenses.')
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the @categories variable' do
      get :index
      expect(assigns(:categories)).to eq([ @category ])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: @category.id }
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the @category variable' do
      get :show, params: { id: @category.id }
      expect(assigns(:category)).to eq(@category)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the @category variable' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: @category.id }
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the @category variable' do
      get :edit, params: { id: @category.id }
      expect(assigns(:category)).to eq(@category)
    end
  end

  describe 'POST #create' do
    context 'when the category is valid' do
      it 'creates a new category' do
        expect do
          post :create, params: { category: { name: 'Clothing', description: 'Categories for clothing expenses.' } }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to the category index page' do
        post :create, params: { category: { id: 2, name: 'Clothing', description: 'Categories for clothing expenses.' } }
        expect(response).to redirect_to category_url(2)
      end
    end

    context 'when the category is invalid' do
      it 'does not create a new category' do
        expect do
          post :create, params: { category: { name: '', description: '' } }
        end.to change(Category, :count).by(0)
      end

      it 'renders the new category page' do
        post :create, params: { category: { name: '', description: '' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'when the category is valid' do
      it 'updates the category' do
        patch :update, params: { id: @category.id, category: { name: 'Food & Drinks' } }
        @category.reload
        expect(@category.name).to eq('Food & Drinks')
      end

      it 'redirects to the category show page' do
        patch :update, params: { id: @category.id, category: { name: 'Food & Drinks' } }
        expect(response).to redirect_to category_url(@category)
      end
    end

    context 'when the category is invalid' do
      it 'does not update the category' do
        patch :update, params: { id: @category.id, category: { name: '', description: '' } }
        @category.reload
        expect(@category.name).not_to eq('')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:category) { create(:category) }

    it 'destroys the category' do
      expect {
        delete :destroy, params: { id: category.id }
      }.to change(Category, :count).by(-1)

      expect(response).to redirect_to(categories_path)
      expect(flash[:notice]).to eq('Category was successfully destroyed.')
    end
  end
end