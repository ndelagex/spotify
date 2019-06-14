class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  require "json"
  require "rest-client"

  def home
    id1 = '0NEJ0N8MDVOwMWVmLFO0Jj'

    myClientKey = ENV["CLIENT_KEY"]

    tokenResponse = RestClient.post("https://accounts.spotify.com/api/token",
      {'grant_type' => 'client_credentials'},
      {'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => myClientKey})

    token = JSON.parse(tokenResponse)

    mykey = "Bearer " + token["access_token"]

    response1 = RestClient.get("https://api.spotify.com/v1/playlists/" + id1,{'Authorization' => mykey})
    @playlist1 = JSON.parse(response1)

    id2 = '54ZyhTBvjoJpVBpIgb8t7K'
    response2 = RestClient.get("https://api.spotify.com/v1/playlists/" + id2,{'Authorization' => mykey})
    @playlist2 = JSON.parse(response2)
  end
end
