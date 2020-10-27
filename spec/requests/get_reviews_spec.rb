require 'rails_helper'

describe 'get all reviews route', :type => :request do
  let!(:reviews) { FactoryBot.create_list(:review, 20) }

  before { get '/reviews' }

  # Test for header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test for body
  it 'returns all reviews' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

end



# Test the City Search Parameter
describe 'get all reviews matching city search', :type => :request do
  let!(:reviews) { FactoryBot.create(:review, content: 'Rad beach town', city: 'Virginia Beach', country: 'United States', user_name: 'vstew', rating: 5) }

  before { get '/reviews?city=Virginia Beach' }

  # Test for header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test for body size
  it 'returns all reviews matching the search' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

  # Test the body content
  it 'returns the correct content' do
    expect(JSON.parse(response.body).first['city']).to eq('Virginia Beach')
  end
end
