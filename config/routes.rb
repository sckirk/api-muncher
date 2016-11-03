Rails.application.routes.draw do
    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # I know I don't need the root
    root 'homepages#index'
    resources :homepages, only: [:show]
end
