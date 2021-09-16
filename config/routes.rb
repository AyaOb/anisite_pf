Rails.application.routes.draw do
  scope module: :public do
    get 'users/mypage' => 'users#show'
    get 'users/edit' => 'users#edit'
    get 'users/confirm' => 'users#confirm'
    patch 'users/update' => 'users#update'
    patch 'users/quit' => 'users#quit'
  end

  devise_for :user, :skip => [:password], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_for :admin, :skip => [:password, :registrations], controllers: {
    sessions: 'admin/sessions'
  }

  # devise_scope :admin do
  #   get 'login' => 'admin/sessions#new'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
