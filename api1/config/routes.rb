Rails.application.routes.draw do

	resources:articles
	post 'articles/test'

	post 'articles/edit'
	post 'articles/delete'
	# get 'articles/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
