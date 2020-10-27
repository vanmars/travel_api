require 'rails_helper'

describe 'Review#destroy', :type => :request do
  # let!(:reviews) { FactoryBot.create_list(:review, 100) }
  let!(:reviews) { FactoryBot.create(:review, content: 'Rad beach town', city: 'Virginia Beach', country: 'United States', user_name: 'vstew', rating: 5, id:2) }

  before do
     delete '/reviews/2?user_name=vstew'
  end

  # Test for header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test for body
  it 'deletes a review' do
    expect(JSON.parse(response.body).values[0]).to eq("Review deleted")
  end
end