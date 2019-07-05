class UpdateFeaturesJob < ApplicationJob
  queue_as :default
  include ::SpotifyHelper

  def perform(*args)
    # Do something later
    playlists = Playlist.all
    playlists.each do |playlist|
      playlistObj = get_playlist(playlist.SpotifyId)
      #computing playlist features
      features = compute_playlist_features(playlistObj)
      playlist.update(
        danceability: features['danceability'],
        energy: features['energy'],
        loudness: features['loudness'],
        speechiness: features['speechiness'],
        acousticness: features['acousticness'],
        instrumentalness: features['instrumentalness'],
        liveness: features['liveness'],
        valence: features['valence'],
        tempo: features['tempo'])
    end
  end
end
