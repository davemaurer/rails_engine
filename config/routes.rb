Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'customers/random', to: 'customers#random'
      resources :customers, except: [:new, :edit] do
        resources :invoices, only: [:index, :show]
      end

      get 'merchants/random', to: 'merchants#random'
      resources :merchants, except: [:new, :edit] do
        resources :invoices, only: [:index, :show]
        resources :items, only: [:index, :show]
      end

      get 'invoices/random', to: 'invoices#random'
      resources :invoices, except: [:new, :edit] do
        resources :transactions, only: [:index, :show]
        resources :invoice_items, only: [:index, :show]
      end


      get 'items/random', to: 'items#random'
      resources :items, except: [:new, :edit] do
        resources :invoice_items, only: [:index, :show]
      end

      get 'transactions/random', to: 'transactions#random'
      resources :transactions, except: [:new, :edit]

      get 'invoice_items/random', to: 'invoice_items#random'
      resources :invoice_items, except: [:new, :edit]
    end
  end
end
