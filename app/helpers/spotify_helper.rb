include ::StatsHelper
require "json"
require "rest-client"
require "daru"
require "open-uri"
require "nokogiri"

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
    track_features = get_features(track_ids.join(',')).compact
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

  def print_tracks_features(playlist_id)
   playlist = get_playlist(playlist_id)
   tracks_info = []
   tracks = playlist['tracks']
   items = tracks['items']
   items.each do |i|
    hashi = {}
    hashi[:id] = i['track']['id'] if i['track']['id']
    hashi[:name] = i['track']['name'] if i['track']['name']
    hashi[:artist] = i['track']['artists'][0]['name'] if i['track']['artists'][0]['name']
    tracks_info << hashi
   end
   track_ids = get_track_ids(playlist)
   track_features = get_features(track_ids.join(',')).compact
   tracks_info_by_id = Hash[tracks_info.map { |h| [h[:id], h] }]
   merged = track_features.map { |h| [tracks_info_by_id[h["id"]],h] }
   flat_merged = merged.map {|a| a[0].merge(a[1])}
   df = Daru::DataFrame.new(flat_merged)
   return df[:id,:name,:artist,"danceability","energy","key","loudness","mode", "speechiness",
    "acousticness", "instrumentalness", "liveness", "valence", "tempo"]
  end

  def get_bio(artist_id)
    url = "https://open.spotify.com/artist/" + artist_id + "/about"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    bio = ''
    html_doc.search('.bio-primary','.bio-secondary').each do |element|
      bio += element.text.strip
    end
    return bio
  end

  def get_artist(id)
    mykey = get_key
    response1 = RestClient.get("https://api.spotify.com/v1/artists/" + id,{'Authorization' => mykey})
    return spotifyArtist = JSON.parse(response1)
  end
end

