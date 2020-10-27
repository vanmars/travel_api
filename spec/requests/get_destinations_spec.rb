require 'rails_helper'

describe "get most reviewed destination", :type => :request do
  let!(:reviews) {
    [ FactoryBot.create(:review, content: 'Rad beach town', city: 'Virginia Beach', country: 'United States', user_name: 'vstew', rating: 5), FactoryBot.create( :review, content: 'Rad beach town', city: 'Virginia Beach', country: 'United States', user_name: 'vstew', rating: 4), FactoryBot.create( :review, content: 'Rad old town', city: 'Colonial Williamsburg', country: 'United States', user_name: 'vstew', rating: 3) ]
  }
  
  before { get '/destination/most_popular' }

  # Test for header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test the Most Reviewed Scope
  it 'returns the objects that are reviewed the most' do
    expect(JSON.parse(response.body).size).to eq(2)
  end
end

describe "get highest rated destination", :type => :request do
  let!(:reviews) {
    [ FactoryBot.create(:review, content: 'Rad beach town', city: 'Virginia Beach', country: 'United States', user_name: 'vstew', rating: 5), FactoryBot.create( :review, content: 'Really rad beach town', city: 'Virginia Beach', country: 'United States', user_name: 'vstew', rating: 4), FactoryBot.create( :review, content: 'Rad old town', city: 'Colonial Williamsburg', country: 'United States', user_name: 'vstew', rating: 3) ]
  }
  
  before { get '/destination/highest_rated' }

    # Test for header
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  
    # Test the Most Reviewed Scope
    it 'returns the objects that have the highest rating' do
      expect(JSON.parse(response.body).size).to eq(2)
    end

     # Test the content in the first returned review
     it 'returns the correct content for review with the highest rating' do
      expect(JSON.parse(response.body)[0]['content']).to eq('Rad beach town')
    end
  end


  describe "get random desitination", :type => :request do
    let!(:reviews) {
      [ FactoryBot.create(:review, content: 'Rad beach town', city: 'Virginia Beach', country: 'United States', user_name: 'vstew', rating: 5), FactoryBot.create( :review, content: 'Really rad beach town', city: 'Norfolk', country: 'United States', user_name: 'vstew', rating: 4), FactoryBot.create( :review, content: 'Rad old town', city: 'Colonial Williamsburg', country: 'United States', user_name: 'vstew', rating: 3) ]
    }
    
    before { get '/destination/random' }
  
      # Test for header
      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    
      # Test that Random returns 1 review object
      it 'returns the objects that have the highest rating' do
        expect(JSON.parse(response.body).size).to eq(1)
      end
  end