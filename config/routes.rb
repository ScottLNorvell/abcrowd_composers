AbcrowdComposers::Application.routes.draw do
  
  devise_for :users

  # Change this?
  root :to => 'subjects#index'

  resources :subjects, only: [:index, :create, :destroy]
  # get 'subjects' => 'subjects#index', as: 'subjects'
  # post 'subjects' => 'subjects#create' #, as: 'subjects'
  # delete 'subject/:id' => 'subjects#destroy', as: 'subject'

  resources :topics, only: [:show, :destroy]
	# get 'topic/:id' => 'topics#show', as: 'topic'
  # delete 'topic/:id' => 'topics#destroy'

  get 'subject/:id/topics' => 'topics#index', as: 'topics'

  post 'subject/:id/topics' => 'topics#create' #, as: 'create_topic'
  
  resources :lyrics, only: [:show, :create, :update]

  get 'topics/:id/lyrics/new' => 'lyrics#new', as: "new_topic_lyrics"
  
  # get 'lyric/:id' => 'lyrics#show', as: 'lyric'
  # post 'lyrics' => 'lyrics#create', as: 'lyrics'



end
