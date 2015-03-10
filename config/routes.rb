BizworldApp::Application.routes.draw do
  
  resources :teachers do
    resources :classrooms
  end

end
