Rails.application.routes.draw do
  resources :models, param: :slug, only: [] do
    get 'model_types', to: 'models#index'
    post 'model_types_price/:model_type_slug', 
      to: 'model_types#model_types_price'
  end
end
