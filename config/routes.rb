Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  constraints(id: /[0-9]+/) do
    resources :users, only: [:show, :create]
    resources :books, only: [:show] do
      get 'income' => 'books#income'
    end
    resources :deals, only: [] do
      collection do
        post 'borrow' => 'deals#borrow'
        post 'return' => 'deals#return'
      end
    end
  end
end
