BizworldApp::Application.routes.draw do

  get "/" => "teachers#index", :as => "root"


  get "/teachers/edit_admin" => 'teachers#edit_admin'
  get "/admin_panel" => 'teachers#admin_panel'
  devise_for :teachers

  get '/teachers/raw_data_pre' => 'teachers#raw_data_pre'
  get '/teachers/raw_data_post' => 'teachers#raw_data_post'
  resources :teachers
  
  get '/classrooms/:id/score_overview' => 'classrooms#score_overview'
  resources :classrooms
  get '/classrooms/:id/add_students_form' => 'classrooms#add_students_form'
  post '/classrooms/:id/add_students' => 'classrooms#add_students'

  resources :students do
    collection { post :import }
  end

  post '/survey/create' => 'surveys#create'

  Bitly.configure do |config|
    config.use_api_version_3
    config.login = 'cs169bizworld'
    config.api_key = 'R_b3491d455043441192ad7e645659cbd0'
  end
end
