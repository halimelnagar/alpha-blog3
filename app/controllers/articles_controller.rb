class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def new
		@article = Article.new
	end

	def index
		@articles = Article.all
		
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
    @article.user=User.first
		if @article.save
			flash[:notice] = "Article was successfully created" # this flash message has to be handled in the view
			redirect_to article_path(@article)
		else

			render 'new'
		end
		
	end

	def edit
		#@article = Article.find(params[:id])
	end

	def update
		#@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article was successfully updated" # this flash message has to be handled in the view
			redirect_to article_path(@article)
		else

			render 'edit'
		end
	end

	def show
		#@article = Article.find(params[:id])
	end

	def destroy
		#@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Article destroyed successfully"
		redirect_to articles_path
	end


	private

		def set_article
			@article = Article.find(params[:id])
		end
		def article_params
			params.require(:article).permit(:title, :description)
		end
end
