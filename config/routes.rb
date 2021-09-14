Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_for :admin, :skip => [:password, :registrations], controllers: {
    sessions: 'admin/sessions'
  }

  # devise_scope :admin do
  #   get 'login' => 'admin/sessions#new'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
