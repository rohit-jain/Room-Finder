GetAroom::Application.routes.draw do
 # map.connect '/listings/apply', :controller => 'listings', :action => 'apply'
#  match "/listings/apply/:id/:oa", :to => 'listings#apply#id#oa'
 # match "/listings/:id/:searchparam", :to => 'listings#show#searchparam' 
  match "/listings/apply/:id", :to => 'listings#apply#id'
  resources :listings
  get "log_in" => "sessions#new", :as => "log_in"  
  get "log_out" => "sessions#destroy", :as => "log_out"  
  get "sign_up" => "users#new", :as => "sign_up"  
  root :to => "users#new"
  #get "listings/apply" => "listings#apply", :as => "listings/apply"
  #reet :to => "listings"
  resources :users  
  resources :sessions 
  end
