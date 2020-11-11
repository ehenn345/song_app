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
    render 'show.json.jb'
  end

end
