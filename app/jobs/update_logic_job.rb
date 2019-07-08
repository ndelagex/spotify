class UpdateLogicJob < ApplicationJob
  queue_as :default
  include ::LogicHelper

  def perform(*args)
    # Do something later
    playlists = Playlist.all
    playlists.each do |playlist|
    featHash = {
      'danceability' => playlist['danceability'],
      'energy' => playlist['energy'],
      'loudness' => playlist['loudness'],
      'speechiness' => playlist['speechiness'],
      'acousticness' => playlist['acousticness'],
      'instrumentalness' => playlist['instrumentalness'],
      'liveness' => playlist['liveness'],
      'valence' => playlist['valence'],
      'tempo' => playlist['tempo']
    }

    logic_features = implement_logic_features(featHash)
    playlist.update(is_dancing: logic_features['is_dancing']) if (playlist.is_dancing == 1)
    playlist.update(is_vocal: logic_features['is_vocal']) if (playlist.is_vocal == 1)
    playlist.update(is_summer: logic_features['is_summer']) if (playlist.is_summer == 1)
    playlist.update(is_robot: logic_features['is_robot']) if (playlist.is_robot == 1)
    end
  end
end
