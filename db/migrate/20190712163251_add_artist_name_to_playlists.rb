class AddArtistNameToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :artistName, :string
  end
end
