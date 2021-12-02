Rails.application.routes.draw do
  devise_for :users
  # ルートパスを設定
  root to: 'homes#top'
  # ルーティングを一括して自動生成
  resources :books
  # onlyで限定
  resources :users, only: [:index, :show, :edit, :update]
end
