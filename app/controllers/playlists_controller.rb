class PlaylistsController < ApplicationController

  include ::SpotifyHelper

  skip_before_action :authenticate_user!, only: [:index, :new]
  require "json"
  require "rest-client"

  def index
    @danceability = params[:danceability]
    @spotifyPlaylists = []
    playlists = Playlist.all

    playlists.each do |p|
      spotifyPlaylist = get_playlist(p.SpotifyId)
      spotifyPlaylist['is_dancing'] = p.is_dancing
      spotifyPlaylist['is_vocal'] = p.is_vocal
      spotifyPlaylist['is_robot'] = p.is_robot
      spotifyPlaylist['is_summer'] = p.is_summer
      @spotifyPlaylists << spotifyPlaylist
    end
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    spotifyPlaylist = get_playlist(params[:playlist][:SpotifyId])
    @playlist.description = spotifyPlaylist['description']
    @playlist.name = spotifyPlaylist['name']
    @playlist.ownerName = spotifyPlaylist['owner']['display_name']
    @playlist.ownerId = spotifyPlaylist['owner']['id']

    features = compute_playlist_features(spotifyPlaylist)
    @playlist.danceability = features['danceability']
    @playlist.energy = features['energy']
    @playlist.loudness = features['loudness']
    @playlist.speechiness = features['speechiness']
    @playlist.acousticness = features['acousticness']
    @playlist.instrumentalness = features['instrumentalness']
    @playlist.liveness = features['liveness']
    @playlist.valence = features['valence']
    @playlist.tempo = features['tempo']

    if @playlist.save
      redirect_to playlists_path
    else
      render :new
    end

  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:SpotifyId) # , places_attributes: [:places, :name, :address])
  end

end
