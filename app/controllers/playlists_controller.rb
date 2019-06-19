class PlaylistsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :new]
  require "json"
  require "rest-client"

  def index
    @spotifyPlaylists = []
    playlists = Playlist.all

    playlists.each do |p|
      @spotifyPlaylists << get_playlist(p.SpotifyId)
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

  def get_playlist(id)
    myClientKey = ENV["CLIENT_KEY"]
    tokenResponse = RestClient.post("https://accounts.spotify.com/api/token",
      {'grant_type' => 'client_credentials'},
      {'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => myClientKey})
    token = JSON.parse(tokenResponse)
    mykey = "Bearer " + token["access_token"]
    response1 = RestClient.get("https://api.spotify.com/v1/playlists/" + id,{'Authorization' => mykey})
    return spotifyPlaylist = JSON.parse(response1)
  end
end
