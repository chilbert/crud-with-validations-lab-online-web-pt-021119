class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
    @song.save
    redirect_to song_path(@song)
  else
    render :new
  end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  def show
      @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit!
  end
end
