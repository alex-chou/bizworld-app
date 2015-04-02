BizworldApp::Application.routes.draw do
  
  get "/" => "teachers#index", :as => "root"

  devise_scope :teacher do
    post "sign_in", :to => "teachers#show"
  end

  devise_for :teachers

  resources :teachers do
    resources :classrooms do
      resources :students
    end
    get '/classrooms/:id/create_link' => 'classrooms#create_link'
  end

  Bitly.configure do |config|
    config.use_api_version_3
  	config.login = 'cs169bizworld'
  	config.api_key = 'R_b3491d455043441192ad7e645659cbd0'
  end
end
