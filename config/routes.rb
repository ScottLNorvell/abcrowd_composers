AbcrowdComposers::Application.routes.draw do
  
  devise_for :users

  # Change this?
  root :to => 'subjects#index'

  resources :subjects, only: [:index, :create, :destroy]

  resources :topics, only: [:show, :destroy]

  get 'subject/:id/topics' => 'topics#index', as: 'topics'

  post 'subject/:id/topics' => 'topics#create' #, as: 'create_topic'
  
  resources :lyrics, only: [:show, :create, :update]
  

  get 'topics/:id/lyrics/new' => 'lyrics#new', as: "new_topic_lyrics"

  resources :lyric_versions, only: [:show, :create, :update]

  post 'lyric_versions/:id/like' => 'lyric_versions#like', as: 'like_lyric_version'

  get 'lines/:id' => 'lines#new', as: 'new_line'
  put 'lines/:id' => 'lines#create', as: 'lyric_line'
  post 'lines/:id' => 'lines#create' #, as: 'lyric_line'

  get 'lines/:id/insert_line' => 'lines#insert_line', as: 'insert_line'
  get 'lines/:id/next' => 'lines#next_line', as: 'next_line'
  get 'lines/:id/previous' => 'lines#previous_line', as: 'previous_line'

end
#== Route Map
# Generated on 25 Sep 2013 18:39
#
#             user_session POST   /users/sign_in(.:format)         devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)        devise/sessions#destroy
#            user_password POST   /users/password(.:format)        devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)    devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)   devise/passwords#edit
#                          PUT    /users/password(.:format)        devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)          devise/registrations#cancel
#        user_registration POST   /users(.:format)                 devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)         devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)            devise/registrations#edit
#                          PUT    /users(.:format)                 devise/registrations#update
#                          DELETE /users(.:format)                 devise/registrations#destroy
#                     root        /                                subjects#index
#                 subjects GET    /subjects(.:format)              subjects#index
#                          POST   /subjects(.:format)              subjects#create
#                  subject DELETE /subjects/:id(.:format)          subjects#destroy
#                    topic GET    /topics/:id(.:format)            topics#show
#                          DELETE /topics/:id(.:format)            topics#destroy
#                   topics GET    /subject/:id/topics(.:format)    topics#index
#                          POST   /subject/:id/topics(.:format)    topics#create
#                   lyrics POST   /lyrics(.:format)                lyrics#create
#                    lyric GET    /lyrics/:id(.:format)            lyrics#show
#                          PUT    /lyrics/:id(.:format)            lyrics#update
#         new_topic_lyrics GET    /topics/:id/lyrics/new(.:format) lyrics#new
#           lyric_versions POST   /lyric_versions(.:format)        lyric_versions#create
#            lyric_version GET    /lyric_versions/:id(.:format)    lyric_versions#show
#                          PUT    /lyric_versions/:id(.:format)    lyric_versions#update
#                 new_line GET    /lines/:id(.:format)             lines#new
#               lyric_line PUT    /lines/:id(.:format)             lines#create
#                          POST   /lines/:id(.:format)             lines#create
#                next_line GET    /lines/:id/next(.:format)        lines#next_line
#            previous_line GET    /lines/:id/previous(.:format)    lines#previous_line
