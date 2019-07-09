class ChangeDataTypeForArtistId < ActiveRecord::Migration[5.2]
  def change
    change_column :playlists, :artistId, :string
  end
end
