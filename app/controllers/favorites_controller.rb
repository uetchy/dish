class FavoritesController < ApplicationController
  permits :name, :address, :lat, :lng

  load_and_authorize_resource

  def index
  end

  def edit
  end

  def create
    if @favorite.save
      redirect_to @favorite, notice: 'Favorite was successfully created.'
    else
      render :new
    end
  end

  def update
    if @favorite.update(favorite)
      redirect_to @favorite, notice: 'Favorite was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @favorite.destroy

    redirect_to favorites_url, notice: 'Favorite was successfully destroyed.'
  end
end
