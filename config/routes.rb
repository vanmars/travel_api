Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reviews 
  get 'destination/most_popular', to: 'reviews#most_popular'
  get 'destination/highest_rated', to: 'reviews#highest_rated'
  get 'destination/random', to: 'reviews#random'
end


