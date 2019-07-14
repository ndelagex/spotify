class UpdateNameJob < ApplicationJob
  queue_as :default
  include ::SpotifyHelper

  def perform(*args)
    # Do something later
    playlists = Playlist.all
    playlists.each do |playlist|
      if playlist.artistId != "1"
        artist = get_artist(playlist.artistId)
        playlist.update(artistName: artist["name"])
      end
    end
  end
end
