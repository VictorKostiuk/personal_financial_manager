require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #report_by_category' do
    it 'returns a success response' do
      get :report_by_category, params: { spend: 100, start_date: '2023-01-01', end_date: '2023-01-31' }
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the @operations and @categories variables' do
      get :report_by_category, params: { spend: 100, start_date: '2023-01-01', end_date: '2023-01-31' }
      expect(assigns(:operations)).to be_an_instance_of(Array)
      expect(assigns(:categories)).to be_an_instance_of(Array)
    end
  end

  describe 'GET #report_by_dates' do
    it 'returns a success response' do
      get :report_by_dates, params: { spend: 100, start_date: '2023-01-01', end_date: '2023-01-31' }
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the @dates and @amount variables' do
      get :report_by_dates, params: { spend: 100, start_date: '2023-01-01', end_date: '2023-01-31' }
      expect(assigns(:dates)).to be_an_instance_of(Array)
      expect(assigns(:amount)).to be_an_instance_of(Array)
    end
  end
end