require "json"
require "rest-client"

module SpotifyHelper
  def get_key
    myClientKey = ENV["CLIENT_KEY"]
    tokenResponse = RestClient.post("https://accounts.spotify.com/api/token",
      {'grant_type' => 'client_credentials'},
      {'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => myClientKey})
    token = JSON.parse(tokenResponse)
    mykey = "Bearer " + token["access_token"]
    return mykey
  end

  def get_playlist(id)
    mykey = get_key
    response1 = RestClient.get("https://api.spotify.com/v1/playlists/" + id,{'Authorization' => mykey})
    return spotifyPlaylist = JSON.parse(response1)
  end

  def get_track_ids(playlist)
    track_ids = []
    tracks = playlist['tracks']
    items = tracks['items']
    items.each do |i|
      track_ids << i['track']['id'] if i['track']['id']
    end
    return track_ids
  end

  def get_features(track_ids)
    mykey = get_key
    response = RestClient.get("https://api.spotify.com/v1/audio-features/?ids=" + track_ids,{'Authorization' => mykey})
    features = JSON.parse(response)
    return features['audio_features']
  end

  def compute_playlist_features(playlist)
    track_ids = get_track_ids(playlist)
    track_features = get_features(track_ids.join(','))
    featHash = {}
    keys = ['danceability','energy','loudness','speechiness','acousticness','instrumentalness','liveness','valence','tempo']
    keys.each do |k|
      keyHash = {}
      keyHash['mean'] = track_features.map {|x| x[k]}.mean
      keyHash['median'] = track_features.map {|x| x[k]}.median
      keyHash['std'] = track_features.map {|x| x[k]}.standard_deviation
      featHash[k] = keyHash
    end
    return featHash
  end

  def mean
    (self.sum/self.length).round(3)
  end

  def sample_variance
    m = self.mean
    sum = self.inject(0){|accum, i| accum +(i-m)**2 }
    sum/(self.length - 1)
  end

  def standard_deviation
    (Math.sqrt(self.sample_variance)).round(3)
  end

  def median
    sorted = self.sort
    len = sorted.length
    (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
end

