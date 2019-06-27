class Playlist < ApplicationRecord
  serialize :danceability,Hash
  serialize :energy, Hash
  serialize :loudness, Hash
  serialize :speechiness, Hash
  serialize :acousticness, Hash
  serialize :instrumentalness, Hash
  serialize :liveness, Hash
  serialize :valence, Hash
  serialize :tempo, Hash
end
