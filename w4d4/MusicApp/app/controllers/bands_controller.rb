class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      # redirects to show page
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update_attributes(band_params)
      # redirects to show page
      redirect_to band_url(@band)
    else
      render :edit
    end

  end

  def destroy
    #redirects to index page
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private

    def band_params
      params.require(:band).permit(:name)
    end

end
