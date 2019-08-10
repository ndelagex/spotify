class LoadAvatarJob < ApplicationJob
  queue_as :default
  include ::SpotifyHelper

  def perform(*args)
    # Do something later
    playlists = Playlist.all
    playlists.each do |playlist|
      if (playlist.artistId != "1")
        spotifyArtist = get_artist(playlist.artistId)
        i = spotifyArtist['images'].first
        playlist.remote_avatar_url = i['url']
        playlist.save
      end
    end
  end
end
