class ArticlesController < ApplicationController

	def show
		@article = Article.find_by(slug: params[:id])
		redirect_to [@article.category, @article], status: :moved_permanently if params[:date]
	end

	def index		
		@category = Category.find_by_slug(params[:category_id])
	end

end