class BandsController < ApplicationController
  before_action :logged_in?

  def create
    @band = Band.new(band_params)

    if @band
      render :index
    else
      flash.now[:errors] = "Invalid band credentials"
      redirect_to :new
    end
  end

  def new
    render :new
  end

  def show
    @band = Band.find(params[:id])
  end

  def index
    @bands = Band.all
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band) #show
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete
    redirect_to bands_url #index
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
