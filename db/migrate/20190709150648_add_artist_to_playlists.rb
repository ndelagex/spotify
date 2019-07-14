class AddArtistToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :artistId, :int
  end
end
