class ArticlesController < ApplicationController

	# rescue_from ActiveRecord::RecordNotDestroyed,with: :not_destroyed#used to handle exceptions
	#this ensures that if this error occured in this controller then it will execute the specified def in with: :
	#we can write this in ApplicationController so that each controller can access it

	def index
		render json:Article.all #Article is an activemodel record which has many methods ,one of them is .all
	end

	def create
		article=Article.create(article_params)
		# article=Article.create!(params[:article])
		# redirect_to 'articles#index'
		if article.save
			render json:article ,status: :created
		else
			render json:article.errors , status: :unprocessable_entity
		end
	end

	def test
		# art=params[:title],params[:content]
		art=article_params
		# art=params[:article]
		render json:art
	end

	def update
		article=Article.find(params[:id])
		article.update(article_params)
		render json:article
	end

	def edit
		article=Article.find(params[:id])
		article.update(article_params)
		render json:article

	end

	def destroy		#using url params method=delete
		Article.destroy(params[:id])
		head :no_content

	# rescue ActiveRecord::RecordNotDestroyed
	# 	render json: {},status: :unprocessable_entity
	end

	def delete	#using body params method=POST
		Article.destroy(params[:id])
		head :no_content
	end

	def article_params
		params.require(:article).permit(:title, :content)
	end

	# def not_destroyed
	# 	render json: {},status: :unprocessable_entity
	# end

end
