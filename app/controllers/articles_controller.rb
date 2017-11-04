class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was successfully created" # this flash message has to be handled in the view
			redirect_to article_path(@article)
		else

			render 'new'
		end
		
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article was successfully updated" # this flash message has to be handled in the view
			redirect_to article_path(@article)
		else

			render 'edit'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	private
		def article_params
			params.require(:article).permit(:title, :description)
		end
end
