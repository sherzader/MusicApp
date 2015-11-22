class AlbumsController < ApplicationController
  before_action :require_login!

  def create
    @album = Album.new(album_params)

    if @album.save
      render :show
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    #only new is nested under band
    @band = Band.find(params[:band_id])
    @album = Album.new(band_id: params[:band_id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      render :show
    else
      flash[:errors] = ["Invalid album credentials"]
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band_id)
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id)
  end
end
