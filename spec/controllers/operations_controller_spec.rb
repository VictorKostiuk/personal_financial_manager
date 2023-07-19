require 'rails_helper'

RSpec.describe OperationsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @operations' do
      operations = create_list(:operation, 3)
      get :index
      expect(assigns(:operations)).to eq(operations)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      operation = create(:operation)
      get :show, params: { id: operation.id }
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @operation' do
      operation = create(:operation)
      get :show, params: { id: operation.id }
      expect(assigns(:operation)).to eq(operation)
    end

    describe 'GET #new' do
      it 'returns a success response' do
        get :new
        expect(response).to have_http_status(:ok)
      end

      it 'assigns @operation' do
        get :new
        expect(assigns(:operation)).to be_a_new(Operation)
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        operation = create(:operation)
        get :edit, params: { id: operation.id }
        expect(response).to have_http_status(:ok)
      end

      it 'assigns @operation' do
        operation = create(:operation)
        get :edit, params: { id: operation.id }
        expect(assigns(:operation)).to eq(operation)
      end
    end

    describe 'POST #create' do
      context 'when the operation is valid' do
        it 'creates a new operation' do
          expect do
            post :create, params: { operation: { amount: 100, odate: '2023-07-19 15:01:59', spend: true, description: 'A new operation', category_id: 1 } }
          end.to change(Operation, :count).by(1)
        end

        it 'redirects to the index page' do
          post :create, params: { operation: { amount: 100, odate: '2023-07-19 15:01:59', spend: true, description: 'A new operation', category_id: 1 } }
          expect(response).to redirect_to(operations_path)
        end
      end

      context 'when the operation is invalid' do
        it 'does not create a new operation' do
          expect do
            post :create, params: { operation: { amount: '', odate: '', spend: true, description: 'A new operation', category_id: 1 } }
          end.not_to change(Operation, :count)
        end

        it 'renders the new page' do
          post :create, params: { operation: { amount: '', odate: '', spend: true, description: 'A new operation', category_id: 1 } }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PATCH #update' do
      context 'when the operation is valid' do
        let(:operation) { create(:operation, amount: 100) }

        it 'updates the operation' do
          patch :update, params: { id: operation.id, operation: { amount: 200, odate: '2023-23-09', spend: false, description: 'An updated operation', category_id: 2 } }
          operation.reload
          expect(operation.amount).to be(200)
          expect(operation.odate).to eq('2023-23-09')
          expect(operation.spend).to be false
          expect(operation.description).to eq('An updated operation')
          expect(operation.category_id).to eq(2)

          expect(response).to redirect_to(operations_path)
          expect(flash[:notice]).to eq('Operation was successfully updated.')
        end
      end

      context 'when the operation is invalid' do
        let(:operation) { create(:operation) }

        it 'does not update the operation' do
          patch :update, params: { id: operation.id, operation: { amount: '', odate: '', spend: true, description: 'A new operation', category_id: 1 } }
          operation.reload
          expect(operation.amount).not_to eq('')
          expect(operation.odate).not_to eq('')
          expect(operation.spend).not_to be true
          expect(operation.description).not_to eq('A new operation')
          expect(operation.category_id).to eq(1)

          expect(response).to render_template(:edit)
        end
      end
    end
  end
end