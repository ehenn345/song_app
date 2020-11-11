class Api::SongsController < ApplicationController

  def index
    @songs = Song.all
    render 'index.json.jb'
  end

  def show
    @song = Song.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @song = Song.new(
      title: params[:title],
      artist: params[:artist],
      album: params[:album],
      year: params[:year]
    )
    @song.save
    render 'show.json.jb'
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.title = params[:title] || @song.title,
    @song.artist = params[:artist] || @song.artist,
    @song.album = params[:album] || @song.album,
    @song.year = params[:year] || @song.year
    @song.save
    render 'show.json.jb'
  end

  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy
    render json: {message: "Song destroyed"}
  end

end
