class TracksController < ApplicationController

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.new(track_params)

    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render :new 
    end
  end

  def destroy
    @track= Track.find(params[:id])
    @track.destroy
    redirect_to bands_url
  end

  private
  def track_params
    params.require(:track).permit(:song, :lyics, :album_id, :ord)
  end

end
