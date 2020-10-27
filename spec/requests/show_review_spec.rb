require 'rails_helper'

describe 'Review#show', type: :request do

  # let!(:reviews) { FactoryBot.create(:city_review, content: 'blah', user_name: 'vstew', id: 1, city: 'Virginia Beach', country: 'United States') }

  let!(:reviews) { FactoryBot.create_list(:review, 1) }  

  before { get '/reviews', params: { id: 1 } }
    
    # Test for header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test for body
  it 'returns 1 review' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

end
