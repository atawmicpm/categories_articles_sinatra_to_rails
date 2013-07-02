class TagsController < ApplicationController

	def index
		@tag = Tag.find_by(slug: params[:id])
	end

end