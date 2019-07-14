class UpdateBioJob < ApplicationJob
  queue_as :default
  include ::SpotifyHelper

  def perform(*args)
    # Do something later
    playlists = Playlist.all
    playlists.each do |playlist|
      if playlist.artistId != "1"
        bio = get_bio(playlist.artistId)
        playlist.update(bio: bio)
      end
    end
  end
end
