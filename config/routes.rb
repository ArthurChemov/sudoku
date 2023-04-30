Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :sudoku_task
  root "sudoku_task#index"
  get 'result', to: "sudoku_task#result"
end
