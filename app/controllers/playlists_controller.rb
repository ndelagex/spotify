class PlaylistsController < ApplicationController

  include ::SpotifyHelper
  include ::LogicHelper

  skip_before_action :authenticate_user!, only: [:index, :new]
  require "json"
  require "rest-client"

  def index
    #get default playlist displayed at the beginning
    @defaultPlaylist = Playlist.find(42)

    #get all playlists as Spotify objects to get picture and all
    #@spotifyPlaylists = []
    @playlists = Playlist.all


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
    #get cover and save it in Cloudinary
    i = spotifyPlaylist['images'].first
    @playlist.remote_photo_url = i['url']

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

    logic_features = implement_logic_features(features)
    @playlist.is_dancing = logic_features['is_dancing']
    @playlist.is_vocal = logic_features['is_vocal']
    @playlist.is_summer = logic_features['is_summer']
    @playlist.is_robot = logic_features['is_robot']

    #getting bio scraping artists page
    bio = get_bio(@playlist.artistId)
    @playlist.bio = bio

    #get artist info using API
    artist = get_artist(@playlist.artistId)
    @playlist.artistName = artist["name"]
    a = artist['images'].first
    @playlist.remote_avatar_url = a['url']

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
    params.require(:playlist).permit(:SpotifyId, :artistId) # , places_attributes: [:places, :name, :address])
  end

end
