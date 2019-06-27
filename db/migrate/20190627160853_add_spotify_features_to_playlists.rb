class AddSpotifyFeaturesToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :danceability, :text
    add_column :playlists, :energy, :text
    add_column :playlists, :loudness, :text
    add_column :playlists, :speechiness, :text
    add_column :playlists, :acousticness, :text
    add_column :playlists, :instrumentalness, :text
    add_column :playlists, :liveness, :text
    add_column :playlists, :valence, :text
    add_column :playlists, :tempo, :text
  end
end
