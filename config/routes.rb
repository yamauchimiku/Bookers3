Rails.application.routes.draw do
  devise_for :users
  # ルートパスを設定
  root to: 'homes#top'
  get 'about' => 'homes#about'
  # ルーティングを一括して自動生成
  resources :books
  # onlyで限定
  # ネストする
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    # asオプションルーティングに名前を指定
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
