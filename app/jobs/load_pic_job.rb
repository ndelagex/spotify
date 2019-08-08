class LoadPicJob < ApplicationJob
  queue_as :default
  include ::SpotifyHelper

  def perform(*args)
    # Do something later
    playlists = Playlist.all
    playlists.each do |playlist|
      spotifyPlaylist = get_playlist(playlist.SpotifyId)
      i = spotifyPlaylist['images'].first
      playlist.remote_photo_url = i['url']
      playlist.save
    end
  end
end
