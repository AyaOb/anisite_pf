Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'user/mypage' => 'users#show'
    get 'user/edit' => 'users#edit'
    get 'user/confirm' => 'users#confirm'
    patch 'user/update' => 'users#update'
    patch 'user/quit' => 'users#quit'
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
