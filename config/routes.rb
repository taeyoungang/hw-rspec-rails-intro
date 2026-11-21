Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root to: redirect('/movies')

  # GET /search
  get "/search", to: "movies#search_tmdb", as: :search_tmdb_movies

  # POST /movies
  post "/movies", to: "movies#create", as: :add_movie
end
