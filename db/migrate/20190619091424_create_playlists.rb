class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :description
      t.string :SpotifyId
      t.string :name
      t.string :ownerName

      t.timestamps
    end
  end
end
