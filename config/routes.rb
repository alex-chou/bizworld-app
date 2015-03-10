BizworldApp::Application.routes.draw do
  
  resources :teachers do
    resources :classrooms
    get '/classrooms/:id/create_link' => 'classrooms#create_link'
  end

end
