Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :users
  # resourcesではなくresourceとなっている点に注意してください。単数にするとそのコントローラのidがリクエストに含まれなくなります。
	# 今回、post_commentsのshowページは必要ないため、resourceとしました。
  	resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
   	end

   	root 'post_images#index'

end
