# frozen_string_literal: true

scope module: :user_management do
  resources :users, except: %i[new create] do
    member do
      get 'save_address_from_mernis'
      get 'save_identity_from_mernis'

      get 'disability', to: 'disability#edit'
      put 'disability', to: 'disability#update'
    end
  end
end
