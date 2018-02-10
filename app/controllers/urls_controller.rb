class UrlsController < ApplicationController
	before_action :set_url, only: [:show, :edit, :update, :destroy]

	def show
	end

	def redirect_to_original_url
		@url = Url.find_by_short_url(params[:short_url])
		redirect_to @url.original_url
	end

	def new
		@url = Url.new
	end

	def create
		@url = Url.new(url_params)
		respond_to do |format|
			if @url.save
				format.html { redirect_to @url, notice: 'Your url has been shorten successfully.' }
				format.json { render :show, status: :created, location: @url }
			else
				format.html { render :new }
				format.json { render json: @url.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def set_url
			@url = Url.find(params[:id])
		end

		def url_params
			params.require(:url).permit(:original_url)
		end
end
