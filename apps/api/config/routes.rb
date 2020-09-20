resources :issues, except: [:new, :edit] do
  resources :attachments, except: [:new, :edit]
end