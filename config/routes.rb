BizworldApp::Application.routes.draw do
  
  get "/" => "teachers#index", :as => "root"

  devise_for :teachers

  resources :teachers do
    resources :classrooms do
      resources :students
    end
    get '/classrooms/:id/create_link' => 'classrooms#create_link'
    get '/classrooms/:id/add_students_form' => 'classrooms#add_students_form'
    post '/classrooms/:id/add_students' => 'classrooms#add_students'
  end

  Bitly.configure do |config|
    config.use_api_version_3
  	config.login = 'cs169bizworld'
  	config.api_key = 'R_b3491d455043441192ad7e645659cbd0'
  end
end 
