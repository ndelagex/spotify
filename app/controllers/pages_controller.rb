class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  require "json"
  require "rest-client"

  def home
    id1 = '0NEJ0N8MDVOwMWVmLFO0Jj'
    mykey = 'Bearer BQDlzrP6HqFWqCw4kYWXVkSLk3XAtSFJzu5QzwWt-xlRsJViCV5wAULoBqCkNe5gtuLWBHQmt8TuBpZtygJaV-UzBHsi2afN3pFuW3zWo_KfJIY-MyEvGogy4Y4Pv3IcJKo3ccVm8tPaTU2h9PyBX_5783kblzFLdmGlWhPvkZQ3gtxaJyUZwRxUcPpoZ8C0R2VWqK5ADbTxq-GNdA7xRwrNrtgwZQ'
    response1 = RestClient.get("https://api.spotify.com/v1/playlists/" + id1,{'Authorization' => mykey})
    @playlist1 = JSON.parse(response1)

    id2 = '54ZyhTBvjoJpVBpIgb8t7K'
    response2 = RestClient.get("https://api.spotify.com/v1/playlists/" + id2,{'Authorization' => mykey})
    @playlist2 = JSON.parse(response2)
  end
end
