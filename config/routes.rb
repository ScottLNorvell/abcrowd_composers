AbcrowdComposers::Application.routes.draw do
  
  devise_for :users

  root :to => 'subjects#index'

  get 'subject/:id/topics' => 'topics#index', as: 'topics'

  get 'subjects' => 'subjects#create', as: 'subjects'

  post 'subjects' => 'subjects#create' #, as: 'subjects'

  post 'subject/:id/topics' => 'topics#create' #, as: 'create_topic'

  get 'topic/:id' => 'topics#show', as: 'topic'


end
