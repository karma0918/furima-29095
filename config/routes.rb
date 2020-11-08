Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  root to: 'items#index'
=======
  get 'orders', to: 'orders#index'
>>>>>>> parent of ff5b1c0... db設計
end
