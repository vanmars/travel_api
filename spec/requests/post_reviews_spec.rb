require 'rails_helper'

describe 'Review#create', type: :request do

  before { post '/reviews', params: { content: 'test_content', city: 'test_city', country: 'test_country', user_name: 'test_user', rating: 5  } }

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

  it 'returns correct content' do
    expect(JSON.parse(response.body)['content']).to eq('test_content')
  end

end