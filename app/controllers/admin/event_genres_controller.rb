class Admin::EventGenresController < ApplicationController

	before_action :authenticate_admin!

	def index
		@genres = EventGenre.all.page(params[:page]).per(15)
		@genre = EventGenre.new
	end

	def create
		@genre = EventGenre.new(genre_params)
		if @genre.save
		   redirect_to admin_event_genres_path
		else
		   @genres = EventGenre.all
		   render :index
		end
	end

	def edit
        @genre = EventGenre.find(params[:id])
	end

	def update
		@genre = EventGenre.find(params[:id])
		if @genre.update(genre_params)
		   redirect_to admin_event_genres_path
		else
		   render :edit
		end
	end

	private

	def genre_params
	    params.require(:event_genre).permit(:name, :other, :is_active)
	end

end
