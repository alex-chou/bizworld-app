BizworldApp::Application.routes.draw do

  get "/" => "teachers#index", :as => "root"

  devise_for :teachers

  resources :teachers
  resources :classrooms
  resources :students

  get '/classrooms/:id/score_overview' => 'classrooms#score_overview'
  get '/classrooms/:id/create_link' => 'classrooms#create_link'
  post '/survey/create' => 'surveys#create'

  Bitly.configure do |config|
    config.use_api_version_3
    config.login = 'cs169bizworld'
    config.api_key = 'R_b3491d455043441192ad7e645659cbd0'
  end
end
