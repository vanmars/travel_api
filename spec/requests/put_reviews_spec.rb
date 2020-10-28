require 'rails_helper'

describe 'put review route', :type => :request do
  let!(:reviews) { FactoryBot.create(:review, content: 'test_content', city: 'test_city', country: 'test_country', user_name: 'test_user', rating: 5, id: 1 ) }

  before { put '/reviews/1', params: {user_name: 'test_user', content: 'patched_test_content'} }

  # Test for header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test for body
  it 'updates a review' do
    expect(JSON.parse(response.body)['message']).to eq("Review updated successfully")
  end
end